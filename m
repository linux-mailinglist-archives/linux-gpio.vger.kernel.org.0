Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C40261925E7
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 11:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgCYKkD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 06:40:03 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:41611 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727129AbgCYKkD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Mar 2020 06:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585132802;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MK8FJi8EH32DABBtM4+Sj2eGy/izEFYJv6Men8xb06o=;
        b=Y33hUYj9ojdPkH38ehcdIz/4WR5SMcO6S3JRA4c1TUDMYJ5uwrHa5bUJdr70dgv/SSbwfe
        9BIu8lL1S/OSmPJUlsIIsGlqqkDO/7Um8p3nqW2MKSR6Nk93qSMAZVcyfgpp1eTKG3O0F/
        a51lWkrJOwqtP2h5gl8bMeIIr1u7/Cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-FaN6xKrfNemWfAjsFbpmZw-1; Wed, 25 Mar 2020 06:40:00 -0400
X-MC-Unique: FaN6xKrfNemWfAjsFbpmZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 401AF107ACCA;
        Wed, 25 Mar 2020 10:39:59 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-75.ams2.redhat.com [10.36.115.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B03A15C1A2;
        Wed, 25 Mar 2020 10:39:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH 0/1 resend] gpiolib: acpi: Add missing __init(const) markers to initcall-s
Date:   Wed, 25 Mar 2020 11:39:55 +0100
Message-Id: <20200325103956.109284-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

I know it has not been that long ago since I send this out, but still
I have the feeling this one seems to have fallen through the cracks?

It has already been Acked by Mika, so if you can queue it up in
linux-gpio/for-next that would be great.

Regards,

Hans

