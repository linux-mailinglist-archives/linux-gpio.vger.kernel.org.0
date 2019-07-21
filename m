Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAA8C6F355
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 15:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfGUNJP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 09:09:15 -0400
Received: from de-outgoing-5-4.antispam.co.za ([144.76.180.171]:34315 "EHLO
        de-outgoing-5-4.antispam.co.za" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726275AbfGUNJP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Jul 2019 09:09:15 -0400
X-Greylist: delayed 932 seconds by postgrey-1.27 at vger.kernel.org; Sun, 21 Jul 2019 09:09:15 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=out.zamailgate.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:reply-to:sender:bcc
        :content-type; bh=buBYYi396xcSaJT/XDuQShpgTr3LN2/3uNKENHO08Sw=; b=Cd32LO9LFWy
        GyLPDeehTKcjqjZrrYhfJyypggveIMxfac7l9/QevxoSw8YP7071PQ1Cq0d3DMSWTdG0Tel0Rc76j
        djr+6LArSpoaxnWwkxE5zVE5gZp1CYUOpzSiFXJAzmr0kdrIDa3ubh2JpCmR/7bb572RT2710479q
        CfdOlc=;
Received: from cp46-jhb.za-dns.com ([164.160.91.39])
        by server5.antispam.co.za with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <hm@bitlabs.co.za>)
        id 1hpBLR-00081Y-Cj; Sun, 21 Jul 2019 14:53:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=bitlabs.co.za; s=default; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=buBYYi396xcSaJT/XDuQShpgTr3LN2/3uNKENHO08Sw=; b=COqRMtcOO64PFkXehzUhI/TtRd
        rued0P6zRKM/0VfnD2pNXiym94MDdcDtlvUnE1Wy+nJCNgipmYGfFw8tMK5+E4JCtVQCCMuvXZ/l8
        UtlJ0roqTFWqObhY0XtFP3VoUFgGp4tYOYMv6SRwBzb2xhEr4nk+FLXmcIxOhHhdDU0ChZoQqwoPl
        sru/wf+jQTHtywYEDE1fC3xeIYXGPk5DvbGURr2zc9a+2+3FN2iCCcucfmVAGNeP1DCS1aycPIQ1X
        eDAoVm4om+05XOPU41xfxfnJaWsz/bx3OJTRmivZa4rgDYu/Ao+z1+Wd2ieN3pww+WE12zhxEWheh
        lbtN6Hlw==;
Received: from [45.56.148.82] (port=49478 helo=localhost.localdomain)
        by cp46-jhb.za-dns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <hm@bitlabs.co.za>)
        id 1hpBLN-0006Fx-Me; Sun, 21 Jul 2019 14:53:38 +0200
From:   Hennie Muller <hm@bitlabs.co.za>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hennie Muller <hm@bitlabs.co.za>
Subject: [PATCH 2/2] [PATCH] gpio: Explicitly cast from __be16 to unsigned short
Date:   Sun, 21 Jul 2019 14:52:59 +0200
Message-Id: <20190721125259.13990-2-hm@bitlabs.co.za>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721125259.13990-1-hm@bitlabs.co.za>
References: <20190721125259.13990-1-hm@bitlabs.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Get-Message-Sender-Via: cp46-jhb.za-dns.com: authenticated_id: hm@bitlabs.co.za
X-Authenticated-Sender: cp46-jhb.za-dns.com: hm@bitlabs.co.za
X-AuthUser: hm@bitlabs.co.za
X-AuthUsername: 
X-AuthDomain: @
X-Originating-IP: 164.160.91.39
X-SpamExperts-Domain: out.zamailgate.com
X-SpamExperts-Username: 164.160.91.39
Authentication-Results: antispam.co.za; auth=pass smtp.auth=164.160.91.39@out.zamailgate.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0STiPCilqAig5bem4hJMKBmpSDasLI4SayDByyq9LIhVeI9b6VwZ3DDl
 ALWhNv8vnUTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3KEwPbPfm46SVmcjKGg/vvJcjg
 psH8EURDj2+nvfVvd2OCDRc7mE6FGcH4GWh0rcZNjb5Y4yyK4cVMCLdgtg9oswvP6sgp/Cgm9hg+
 aKQBPsK+N5nG6G/3iwkegTmD8LVCYCTwuapYHJC4Tg2AsI28yjI08kz8IMGRUJ+wCrJ2Otaz5Syd
 WSH0rH63HiY0gg7ajjPEWb6iCVLQ9/3YJnY0urQECoD7tXk5DWl5CthSgMiL6MkaMp8wmQonzS4S
 mVPetvaF1wvahLF7fn6stPOQnRHmBDjB5dBfrKK6brkLGEEAi1fNjOTGPw1WbSK2CLHT1DazhdmC
 tripa4vix9d+LDxIPj1UU4msT2Odp9D6f/NhwcWHRC6wZYUOUOFbYTyLX+GM6unUtNX7p31A+jrv
 1Q5FeC4tytch5aOT5kkeKlgYR0M9co5K3vHM563cCqjV49m/kXtHMZLehVy2OJlt2j3dKxLhoxcm
 aInYbR5vlqFdXQ7uGDLB2H+/FeyuwGDE6OzOQntygAhcyxKY3zevmkVBVFOfybSyihFLuHrF0SAp
 OMQJvQ/Ck3iiU+4DQAj3fpzRIzzgHHNpkiopd/EYQtHARfaad0wX0dtjby8vx7/DGwkCl9w2fkLy
 M/2u1DALko3tzxLr3iY05QV039RV5rWDwPdGGQrkGEl3HM9Z0HcgX9iM+ZHcbTmJo7AdaWB4FGzo
 U4UQ7kfOPMXZSDIkcnfnS1sQ2lU1ojhss6m6CisW+oJtyG1C7hFyWbydVxAvfXdD1ehzU0aBKsri
 WnMGTc5E7CxTeb+PXp9vfNeY2TLDrq+TbJF3aeF44wDkHDZ6XPWlFdaGOH191uXjgjQN/Y3lBqKt
 A01vC3FWwyyzKsHpuzhRGeBg3lFh4U2l2IYde0+ahziiMH54cFNN8s3U12MXSLBvmNOl3tg+JoTA
 KpSJvXzobDJyUVEv3v3xOoI2NZ2dffprtS99//gWO/K2VMSiUuvJJoqKJa784HZRC/79o0QwB/Tw
 iLvM1GdDenSZ1BBHnfQWPa3yu2LnNBRhJke3eAlqUrf7Jv4GIZjXCEg=
X-Report-Abuse-To: spam@server1.antispam.co.za
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

cpu_to_be16 returns a __be16 value. This does not break anything
but does cause sparse to generate unnecessary warnings.

Signed-off-by: Hennie Muller <hm@bitlabs.co.za>
---
 drivers/gpio/gpio-viperboard.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index c301c1d56dd2..7ff80d18bb70 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -258,8 +258,8 @@ static int vprbrd_gpiob_setdir(struct vprbrd *vb, unsigned int offset,
 	int ret;
 
 	gbmsg->cmd = VPRBRD_GPIOB_CMD_SETDIR;
-	gbmsg->val = cpu_to_be16(dir << offset);
-	gbmsg->mask = cpu_to_be16(0x0001 << offset);
+	gbmsg->val = (__force u16)cpu_to_be16(dir << offset);
+	gbmsg->mask = (__force u16)cpu_to_be16(0x0001 << offset);
 
 	ret = usb_control_msg(vb->usb_dev, usb_sndctrlpipe(vb->usb_dev, 0),
 		VPRBRD_USB_REQUEST_GPIOB, VPRBRD_USB_TYPE_OUT, 0x0000,
@@ -321,8 +321,8 @@ static void vprbrd_gpiob_set(struct gpio_chip *chip,
 		mutex_lock(&vb->lock);
 
 		gbmsg->cmd = VPRBRD_GPIOB_CMD_SETVAL;
-		gbmsg->val = cpu_to_be16(value << offset);
-		gbmsg->mask = cpu_to_be16(0x0001 << offset);
+		gbmsg->val = (__force u16)cpu_to_be16(value << offset);
+		gbmsg->mask = (__force u16)cpu_to_be16(0x0001 << offset);
 
 		ret = usb_control_msg(vb->usb_dev,
 			usb_sndctrlpipe(vb->usb_dev, 0),
-- 
2.22.0

