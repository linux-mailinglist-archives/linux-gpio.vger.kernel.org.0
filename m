Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E756D6F358
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Jul 2019 15:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfGUNOI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 09:14:08 -0400
Received: from de-outgoing-6-14.antispam.co.za ([88.99.16.45]:46921 "EHLO
        de-outgoing-6-14.antispam.co.za" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726188AbfGUNOH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 Jul 2019 09:14:07 -0400
X-Greylist: delayed 1225 seconds by postgrey-1.27 at vger.kernel.org; Sun, 21 Jul 2019 09:14:06 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=out.zamailgate.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:reply-to:sender:bcc:in-reply-to:references
        :content-type; bh=J0cRu8FR64IlVCsITEjWx54lwokJlooa+VUMdoJwBZ8=; b=vP5SZOW/xmY
        0fOzgSDd989MW5yuleQzrdodSGoTDUkm3Yh6XgV9F+w2weC7cE473rofxSNCGIvdbCNJ/NaAzh3RW
        DYBlJJbxVhZSDcB4WJ7l/FkX95pkgZ6T3C33CsyqdwOM6TGlLZ2Idz7EfZnySXV6EqxRxGewpvPcJ
        ELxiRs=;
Received: from cp46-jhb.za-dns.com ([164.160.91.39])
        by server6.antispam.co.za with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <hm@bitlabs.co.za>)
        id 1hpBLO-0004n0-27; Sun, 21 Jul 2019 14:53:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=bitlabs.co.za; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=J0cRu8FR64IlVCsITEjWx54lwokJlooa+VUMdoJwBZ8=; b=dCoBYaURpx3GvFnKv4iG4gKarP
        Diuwd++dIq+RQwPQS5JgvoC4FnZY7UeFfpAI0sv4ampoXFmyv1PBNCsPnUpaAKze/4+pSwEpEa+0d
        G6wZDK/Bpae58FnAQRrjMcb7lALIhJZMCCHHyzVhfhHyaRbeAnA7gLgFXU7xv6l0zgOe+msk2gzoN
        qBpJaaBLlghakeYkwLT2iYV1A+jaNpW4LJC9LbAC/wtf6SoSc4xc94xTuWIpRdgRH9stZgb9BXUDn
        RI+kmA5A0HkkJdg+U400BeIUTcnO5EJkpJVD71t5QgOWNcIySzWKQ+bePI0PLmFLYVEs75OBUAgNK
        WQdQfiNw==;
Received: from [45.56.148.82] (port=49478 helo=localhost.localdomain)
        by cp46-jhb.za-dns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <hm@bitlabs.co.za>)
        id 1hpBLI-0006Fx-C2; Sun, 21 Jul 2019 14:53:33 +0200
From:   Hennie Muller <hm@bitlabs.co.za>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hennie Muller <hm@bitlabs.co.za>
Subject: [PATCH 1/2] [PATCH] gpio: Replace usage of bare 'unsigned' with 'unsigned int'
Date:   Sun, 21 Jul 2019 14:52:58 +0200
Message-Id: <20190721125259.13990-1-hm@bitlabs.co.za>
X-Mailer: git-send-email 2.22.0
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
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00194809870042)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0STiPCilqAig5bem4hJMKBmpSDasLI4SayDByyq9LIhVQ33prlyF+zzt
 fD84S268FkTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3KEwPbPfm46SVmcjKGg/vvJcjg
 psH8EURDj2+nvfVvd2OCDRc7mE6FGcH4GWh0rcZNjb5Y4yyK4cVMCLdgtg9oswvP6sgp/Cgm9hg+
 aKQBPsK+N5nG6G/3iwkegTmD8LVCYCTwuapYHJC4Tg2AsI28yjI08kz8IMGRUJ+wCrJ2OtY00I4e
 jIXnqYa5AVtRR2tLjjPEWb6iCVLQ9/3YJnY0urQECoD7tXk5DWl5CthSgMiL6MkaMp8wmQonzS4S
 mVPe9uuzeWEPXD/+vbO7+ZPQHhHmBDjB5dBfrKK6brkLGEEAi1fNjOTGPw1WbSK2CLHT1DazhdmC
 tripa4vix9d+LDxIPj1UU4msT2Odp9D6f/NhwcWHRC6wZYUOUOFbYTyLX+GM6unUtNX7p31A+jrv
 1Q5FeC4tytch5aOT5kkeKlgYR0M9co5K3vHM563cCqjVgYaek/ieoycx5b/lM6HtBzqsOfS1M5Vy
 YnCojwm7ad63wOzweEy7wCy4L5c/QhZ1XQWYbcBfinc9U65Z+pgHiL7i+r8eP7hvhRqtk9Ph7Vcg
 r/U0flMcy2Vi/IcBgY4a4nD4ixtEBgLUs9VA8/4/8xQgoW7Jlml5bhJtfEFIJGv3fC9lMKE9bB8O
 BO2UvN9slvu3OYGmYzZYDfN8qv3mxOBkuUNCzvByHVVRZV1+iolfYLeyrZ3u6v2kN950u2CtIn51
 ZJswLlsWTRVBLcs4Ieylot/0lnPV9b8kDW67MfgFojv4S2FgEBbaLcJN3hGmceaYrWk6Xy16ieyL
 BOf+heCOGHvN1U/wae2O6OiWBfO9kSUzYaL89bSzp9UN8wd+2lyXP3FCjYAwz5IpUkJGwR/ieAuY
 rQs5ttmJcF7JASmZYYlAkKI8DQHsmtRSCvwkSCyiHgGOYO4l5G8kEKfY/Q++xPPelMXS6aSC0kge
 hbHbdN3jqUo47OzICHSG0roIkCaPansa6p5kMuXPHaXSAMVGrgrADVqLkCmG9o9OgRqBmKo17aOO
 u4q8VqJ4N/c49dLX6qBpW3U5Ey2lggFy2ga+u6snHbxri2kdsYaFFMjJDteus1I6gIQ+Ke7Ir9sX
X-Report-Abuse-To: spam@server1.antispam.co.za
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes a couple of warnings by checkpatch and sparse.

Signed-off-by: Hennie Muller <hm@bitlabs.co.za>
---
 drivers/gpio/gpio-viperboard.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index 9b604f13e302..c301c1d56dd2 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -79,7 +79,7 @@ MODULE_PARM_DESC(gpioa_freq,
 /* ----- begin of gipo a chip -------------------------------------------- */
 
 static int vprbrd_gpioa_get(struct gpio_chip *chip,
-		unsigned offset)
+		unsigned int offset)
 {
 	int ret, answer, error = 0;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
@@ -129,7 +129,7 @@ static int vprbrd_gpioa_get(struct gpio_chip *chip,
 }
 
 static void vprbrd_gpioa_set(struct gpio_chip *chip,
-		unsigned offset, int value)
+		unsigned int offset, int value)
 {
 	int ret;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
@@ -170,7 +170,7 @@ static void vprbrd_gpioa_set(struct gpio_chip *chip,
 }
 
 static int vprbrd_gpioa_direction_input(struct gpio_chip *chip,
-			unsigned offset)
+			unsigned int offset)
 {
 	int ret;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
@@ -207,7 +207,7 @@ static int vprbrd_gpioa_direction_input(struct gpio_chip *chip,
 }
 
 static int vprbrd_gpioa_direction_output(struct gpio_chip *chip,
-			unsigned offset, int value)
+			unsigned int offset, int value)
 {
 	int ret;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
@@ -251,8 +251,8 @@ static int vprbrd_gpioa_direction_output(struct gpio_chip *chip,
 
 /* ----- begin of gipo b chip -------------------------------------------- */
 
-static int vprbrd_gpiob_setdir(struct vprbrd *vb, unsigned offset,
-	unsigned dir)
+static int vprbrd_gpiob_setdir(struct vprbrd *vb, unsigned int offset,
+	unsigned int dir)
 {
 	struct vprbrd_gpiob_msg *gbmsg = (struct vprbrd_gpiob_msg *)vb->buf;
 	int ret;
@@ -273,7 +273,7 @@ static int vprbrd_gpiob_setdir(struct vprbrd *vb, unsigned offset,
 }
 
 static int vprbrd_gpiob_get(struct gpio_chip *chip,
-		unsigned offset)
+		unsigned int offset)
 {
 	int ret;
 	u16 val;
@@ -305,7 +305,7 @@ static int vprbrd_gpiob_get(struct gpio_chip *chip,
 }
 
 static void vprbrd_gpiob_set(struct gpio_chip *chip,
-		unsigned offset, int value)
+		unsigned int offset, int value)
 {
 	int ret;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
@@ -338,7 +338,7 @@ static void vprbrd_gpiob_set(struct gpio_chip *chip,
 }
 
 static int vprbrd_gpiob_direction_input(struct gpio_chip *chip,
-			unsigned offset)
+			unsigned int offset)
 {
 	int ret;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
@@ -359,7 +359,7 @@ static int vprbrd_gpiob_direction_input(struct gpio_chip *chip,
 }
 
 static int vprbrd_gpiob_direction_output(struct gpio_chip *chip,
-			unsigned offset, int value)
+			unsigned int offset, int value)
 {
 	int ret;
 	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
-- 
2.22.0

