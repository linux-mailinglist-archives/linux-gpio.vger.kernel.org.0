Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF2D1104FD
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 20:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfLCTYG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 14:24:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32058 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726932AbfLCTYG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 14:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575401045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=XxX0mo96S93piZ0vP4wNUMXYeZYOeelKGt11Ux+BzCg=;
        b=NpzekUsovTCMWSjCIM+UTIs2uLMEDLPum1kaU0TOBjUkgQCnK8hDrcVTIYEuKf5cYkQCTg
        2X3/IjubKp0t9yfuptEOgzZ66/FGLNmsxU78PoqQQ50dwzj2XqrJNKjU8K/6nSAP++f6tv
        +g+9SqmnkFEU3poEw4oEGi4BLc44W0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-oWB9JhkYMmCq9iz7iJg1yQ-1; Tue, 03 Dec 2019 14:23:57 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FC8A800D41;
        Tue,  3 Dec 2019 19:23:56 +0000 (UTC)
Received: from jsavitz.bos.com (ovpn-124-236.rdu2.redhat.com [10.10.124.236])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 895F45C1B5;
        Tue,  3 Dec 2019 19:23:55 +0000 (UTC)
From:   Joel Savitz <jsavitz@redhat.com>
To:     linux-gpio@vger.kernel.org
Cc:     Joel Savitz <jsavitz@redhat.com>, fedora-rpi@googlegroups.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod] bindings: python: fix segfault when calling Line.request()
Date:   Tue,  3 Dec 2019 14:23:05 -0500
Message-Id: <20191203192305.31722-1-jsavitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: oWB9JhkYMmCq9iz7iJg1yQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When Line.request() is called without the required 'consumer=3Dvalue'
argument, the module attempts access an empty dictionary object
resulting in a segfault. This patch avoids such access when the
dictionary is empty and maintains the current design where the
LineBulk object is responsible for validation of arguments.

Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
 bindings/python/gpiodmodule.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 2f6ef51..ae7e1cc 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -434,8 +434,12 @@ static PyObject *gpiod_Line_request(gpiod_LineObject *=
self,
 =09gpiod_LineBulkObject *bulk_obj;
 =09int rv;
=20
-=09def_val =3D PyDict_GetItemString(kwds, "default_val");
-=09def_vals =3D PyDict_GetItemString(kwds, "default_vals");
+=09if (PyDict_Size(kwds) > 0) {
+=09=09def_val =3D PyDict_GetItemString(kwds, "default_val");
+=09=09def_vals =3D PyDict_GetItemString(kwds, "default_vals");
+=09} else {
+=09=09def_val =3D def_vals =3D NULL;
+=09}
=20
 =09if (def_val && def_vals) {
 =09=09PyErr_SetString(PyExc_TypeError,
--=20
2.23.0

