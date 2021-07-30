Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCAD3DBB2B
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 16:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239551AbhG3Otr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 10:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239483AbhG3Otj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 10:49:39 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A686C0617B0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:31 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id gn26so17273646ejc.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=21ZGNuzwEHiEcUhGsOE28cnE6TpdhYH0dz9pLV6DTy8=;
        b=q+TZ4GN7NDpiauPfHRA8wuq0TXGl5nFCopympoMiK713uSG1Tqg/ML90uERBQgTqwz
         ZbzE0VZVrIT3MrkXC9Urw7GFfbRQwOegHhKhUd1C98HqcBIM3cPvyvw/TA8HeEZs7lF7
         jpECUsIB7Bqxpt6hgbsHOF7p14eT7JzvpBlrOD28t1i7NQZJsAwiqtim466FDLR9BjGz
         kpXC/3OTpvmrDA1YZWUlFv0LynIJrawjdXd3uLO88RfSrmjJaYc35VyAU0bMEWpvoZ6U
         R29l5WKsh845qdVu5PFo0vc/riQkQlLIQn1N+MBqd7gCLs3RThwTUrrnew7puSNm+zhc
         HXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=21ZGNuzwEHiEcUhGsOE28cnE6TpdhYH0dz9pLV6DTy8=;
        b=auxG82VxLnDqE8WscrFU13HtfEueb7zKbXIdTqRVXokXQ+cdHIPH2TYKQyrWXCz9R4
         YXW3UHjfqK1AYicEvttIFFD4bcI+jJA/FAAijYMc+98dcUO9XCA8b072n9g/Ge7MA/EW
         SDjS3GCQgl/BbhmPfyvEMi4fE46zFljZhV50Uyd03rXo/5LkevwDQQVySSfJTUYZ2CkS
         tNwYklrU4J9w9HpjaK5h3bTpIon9jfCSMVDzUXhXd/bxxvU/ze28CCaZbqFGA79xMKOV
         rJXTVbABNz6pQl6ZIQKGYQ8OyfUZsRa4VtSDQ9TjTeo8pzLvAvm35CmnaadzVa8tDkB9
         zByA==
X-Gm-Message-State: AOAM5316IscYhXNxwzvoYm5F6cTxtBvb4b71FGGkFpAkeZca4Ba1+3HA
        h8INwiJqzcwxfVCGw6pNdsH6mw==
X-Google-Smtp-Source: ABdhPJwSskfangTlK5Lgk3RCYjpm/3FuvbcD+rYAJAfgK2wI9TrEtmMht/jHXZKOgg/o23sR33xT+g==
X-Received: by 2002:a17:906:4fd6:: with SMTP id i22mr2976400ejw.92.1627656570097;
        Fri, 30 Jul 2021 07:49:30 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id p23sm813317edw.94.2021.07.30.07.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:29 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 04/12] tty: serial: samsung: Init USI to keep clocks running
Date:   Fri, 30 Jul 2021 17:49:14 +0300
Message-Id: <20210730144922.29111-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

UART block is a part of USI (Universal Serial Interface) IP-core in
Samsung SoCs since Exynos9810 (e.g. in Exynos850). USI allows one to
enable one of three types of serial interface: UART, SPI or I2C. That's
possible because USI shares almost all internal circuits within each
protocol. USI also provides some additional registers so it's possible
to configure it.

One USI register called USI_OPTION has reset value of 0x0. Because of
this the clock gating behavior is controlled by hardware (HWACG =
Hardware Auto Clock Gating), which simply means the serial won't work
after reset as is. In order to make it work, USI_OPTION[2:1] bits must
be set to 0b01, so that HWACG is controlled manually (by software).
Bits meaning:
  - CLKREQ_ON = 1: clock is continuously provided to IP
  - CLKSTOP_ON = 0: drive IP_CLKREQ to High (needs to be set along with
                    CLKREQ_ON = 1)

USI is not present on older chips, like s3c2410, s3c2412, s3c2440,
s3c6400, s5pv210, exynos5433, exynos4210. So the new boolean field
'.has_usi' was added to struct s3c24xx_uart_info. USI registers will be
only actually accessed when '.has_usi' field is set to "1".

This feature is needed for further serial enablement on Exynos850, but
some other new Exynos chips (like Exynos9810) may benefit from this
feature as well.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 33 +++++++++++++++++++++++++++++++-
 include/linux/serial_s3c.h       |  9 +++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 9fbc61151c2e..0f3cbd0b37e3 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -65,6 +65,7 @@ enum s3c24xx_port_type {
 struct s3c24xx_uart_info {
 	char			*name;
 	enum s3c24xx_port_type	type;
+	unsigned int		has_usi;
 	unsigned int		port_type;
 	unsigned int		fifosize;
 	unsigned long		rx_fifomask;
@@ -1352,6 +1353,29 @@ static int apple_s5l_serial_startup(struct uart_port *port)
 	return ret;
 }
 
+static void exynos_usi_init(struct uart_port *port)
+{
+	struct s3c24xx_uart_port *ourport = to_ourport(port);
+	struct s3c24xx_uart_info *info = ourport->info;
+
+	if (!info->has_usi)
+		return;
+
+	/*
+	 * USI_RESET is an active High signal. Reset value of USI_RESET is 0x1
+	 * to drive stable value to PAD. Due to this feature, the USI_RESET must
+	 * be cleared (set as 0x0) before starting a transaction.
+	 */
+	wr_regl(port, USI_CON, USI_RESET);
+	udelay(1);
+
+	/*
+	 * Set the HWACG option bit in case of UART Rx mode.
+	 * CLKREQ_ON = 1, CLKSTOP_ON = 0 (set USI_OPTION[2:1] = 0x1).
+	 */
+	wr_regl(port, USI_OPTION, USI_HWACG_CLKREQ_ON);
+}
+
 /* power power management control */
 
 static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
@@ -1379,6 +1403,7 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
 		if (!IS_ERR(ourport->baudclk))
 			clk_prepare_enable(ourport->baudclk);
 
+		exynos_usi_init(port);
 		break;
 	default:
 		dev_err(port->dev, "s3c24xx_serial: unknown pm %d\n", level);
@@ -2102,6 +2127,8 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 	if (ret)
 		pr_warn("uart: failed to enable baudclk\n");
 
+	exynos_usi_init(port);
+
 	/* Keep all interrupts masked and cleared */
 	switch (ourport->info->type) {
 	case TYPE_S3C6400:
@@ -2750,10 +2777,11 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 #endif
 
 #if defined(CONFIG_ARCH_EXYNOS)
-#define EXYNOS_COMMON_SERIAL_DRV_DATA				\
+#define EXYNOS_COMMON_SERIAL_DRV_DATA_USI(_has_usi)		\
 	.info = &(struct s3c24xx_uart_info) {			\
 		.name		= "Samsung Exynos UART",	\
 		.type		= TYPE_S3C6400,			\
+		.has_usi	= _has_usi,			\
 		.port_type	= PORT_S3C6400,			\
 		.has_divslot	= 1,				\
 		.rx_fifomask	= S5PV210_UFSTAT_RXMASK,	\
@@ -2773,6 +2801,9 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 		.has_fracval	= 1,				\
 	}							\
 
+#define EXYNOS_COMMON_SERIAL_DRV_DATA				\
+	EXYNOS_COMMON_SERIAL_DRV_DATA_USI(0)
+
 static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
 	EXYNOS_COMMON_SERIAL_DRV_DATA,
 	.fifosize = { 256, 64, 16, 16 },
diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index f6c3323fc4c5..013c2646863e 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -28,6 +28,15 @@
 #define S3C2410_UFSTAT	  (0x18)
 #define S3C2410_UMSTAT	  (0x1C)
 
+/* USI Control Register offset */
+#define USI_CON			(0xC4)
+/* USI Option Register offset */
+#define USI_OPTION		(0xC8)
+/* USI_CON[0] = 0b0: clear USI global software reset (Active High) */
+#define USI_RESET		(0<<0)
+/* USI_OPTION[2:1] = 0b01: continuously provide the clock to IP w/o gating */
+#define USI_HWACG_CLKREQ_ON	(1<<1)
+
 #define S3C2410_LCON_CFGMASK	  ((0xF<<3)|(0x3))
 
 #define S3C2410_LCON_CS5	  (0x0)
-- 
2.30.2

