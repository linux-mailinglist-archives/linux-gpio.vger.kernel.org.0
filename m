Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A77311F91B
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 17:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfLOQiT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 11:38:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51844 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726136AbfLOQiT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 11:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576427897;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=0xv0+3tSKNk/ps0C2flwuIl5hdVqRnVV8Q2tM73ssjw=;
        b=OJYW3YG4KvPdhXAHFuqUGXGE7ZcrxGQZAJABdcuJF51hj98ibC2eM12R5eiFUY4g00rQab
        VhZXKJcQML4766C7uXOs5aKgNECQKK/HFyc4wum7y/ES08L+NyRnqsVnD75NIeYb+N7K1e
        ME0TymY6eUqyV/eh83tvb0zIZXwBK5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-5CKBZr4SNwe0EMgtsxAapA-1; Sun, 15 Dec 2019 11:38:16 -0500
X-MC-Unique: 5CKBZr4SNwe0EMgtsxAapA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30625477;
        Sun, 15 Dec 2019 16:38:14 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 08C605D9C9;
        Sun, 15 Dec 2019 16:38:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable GPIOs from VBT
Date:   Sun, 15 Dec 2019 17:38:05 +0100
Message-Id: <20191215163810.52356-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

This is a new (completely rewritten) version of my patches to make the
i915 code control the SoC panel- and backlight-enable GPIOs on Bay Trail
devices when the VBT indicates that the SoC should be used for backlight
control. This fixes the panel not lighting up on various devices when
booted with a HDMI monitor connected, in which case the firmware skips
initializing the panel as it inits the HDMI instead.

This series has been tested on; and fixes this issue on; the following mo=
dels:

Peaq C1010
Point of View MOBII TAB-P800W
Point of View MOBII TAB-P1005W
Terra Pad 1061
Thundersoft TST178
Yours Y8W81

Linus, this series starts with the already discussed pinctrl change to
export the function to unregister a pinctrl-map. We can either merge this
through drm-intel, or you could pick it up and then provide an immutable
branch with it for merging into drm-intel-next. Which option do you prefe=
r?

Lee, I know you don't like this, but unfortunately this series introcudes
some (other) changes to drivers/mfd/intel_soc_pmic_core.c. The GPIO subsy=
s
allows only one mapping-table per consumer, so in hindsight adding the co=
de
which adds the mapping for the PMIC panel-enable pin to the PMIC mfd driv=
er
was a mistake, as the PMIC code is a provider where as mapping-tables are
per consumer. The 4th patch fixes this by moving the mapping-table to the
i915 code, so that we can also add mappings for some of the pins on the S=
oC
itself. Since this whole series makes change to the i915 code I plan to
merge this mfd change to the drm-intel tree.

Regards,

Hans

