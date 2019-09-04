Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE70EA7F84
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 11:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfIDJhZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 05:37:25 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37056 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfIDJhY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 05:37:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id t14so18984090lji.4
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2019 02:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L4VJX2Pw0395MUkLOUX1U9okzT3OQ+ogzktYer/yBYM=;
        b=h4ULsmxjbJ/cSx4l6YcHu1MPGZQwGcbH4+oXnl7qPXPhYS1NjUsPnc8kMU0mBWGL11
         uzOLIRe0AObcpmBkQBPv34FmVeaSw9sm3URCedrXVorIKANNxIgHPSbPpJ4tYcMrC+1f
         GON3Cn5H9uCME9tmZheEGwrTNLTIgSZGO9QVcjd6cJTl2XWSZS2AMYr/AzWTOJMZ3Gs7
         JRhO9i/9h3A/UKcXB1PZ6gjVh6Zvkqj1dY11Rdy9TDn2dnTLsGIZAL9g/d4mEJZ0BLcR
         /6C/RajUxU2otuJ/CviIkmyLYOnKRr8lQLIRqviPQJLXQurTd+XdTQizixq1lgYILON+
         2p0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L4VJX2Pw0395MUkLOUX1U9okzT3OQ+ogzktYer/yBYM=;
        b=jPobl17U2BT6ZKVqlb6rrHvniViS14//VjnYOHkDMUQlbrDTsg8MNCyksH0ZCKvoTN
         jCjEVu0yQ7SfNE7bq5ClRa6hAAybwczbdWnnifWQv3tGd7O1OcV4smgJ5RYB8Reezuy8
         iUytTSBpfM0Kas2o2eZrgIBcV3NhCI/hnnGg36i+mA6miQM2tvj50r1jsEdBUdbPgccY
         mBGHgWrSwZFpCwbRE4vRnUqavYjl56SFRcCJCF1TwMktOJgrYsIyBOPY+jsb8AAnECf+
         mOECq7VAwHp7Tl0nHTrr2VXOvkGu/4SrysJchl3ww9uy0m4C4WJNRK2elbUTdp9rE6uu
         qmQw==
X-Gm-Message-State: APjAAAX/ABnbjgRCTkfIYPmG7vz1mFzOoUGOp+mkuBDotzVOcobO7abz
        To8Pjm/ib6yFXhO9FTz+pBSq0uuW8bw=
X-Google-Smtp-Source: APXvYqzsIIfPeM7JaKMrhLTwctF9sJ4mxfSJmggIHVQDd+cc/AE1nA/eLPJ8J16Crz5UJRldx7fuJQ==
X-Received: by 2002:a2e:96d3:: with SMTP id d19mr3608231ljj.185.1567589841023;
        Wed, 04 Sep 2019 02:37:21 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id h2sm1315082ljb.11.2019.09.04.02.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 02:37:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Inline kerneldoc
Date:   Wed,  4 Sep 2019 11:37:18 +0200
Message-Id: <20190904093718.13700-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Switch to the new style of kerneldoc where all doc is inside
the struct definition. Part of the kerneldoc is already doing
this and it has proven to be better for maintenance.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/gpio/driver.h | 224 ++++++++++++++++++++++++------------
 1 file changed, 150 insertions(+), 74 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b74a3bee85e5..d72e05244035 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -240,78 +240,7 @@ struct gpio_irq_chip {
 };
 
 /**
- * struct gpio_chip - abstract a GPIO controller
- * @label: a functional name for the GPIO device, such as a part
- *	number or the name of the SoC IP-block implementing it.
- * @gpiodev: the internal state holder, opaque struct
- * @parent: optional parent device providing the GPIOs
- * @owner: helps prevent removal of modules exporting active GPIOs
- * @request: optional hook for chip-specific activation, such as
- *	enabling module power and clock; may sleep
- * @free: optional hook for chip-specific deactivation, such as
- *	disabling module power and clock; may sleep
- * @get_direction: returns direction for signal "offset", 0=out, 1=in,
- *	(same as GPIOF_DIR_XXX), or negative error.
- *	It is recommended to always implement this function, even on
- *	input-only or output-only gpio chips.
- * @direction_input: configures signal "offset" as input, or returns error
- *	This can be omitted on input-only or output-only gpio chips.
- * @direction_output: configures signal "offset" as output, or returns error
- *	This can be omitted on input-only or output-only gpio chips.
- * @get: returns value for signal "offset", 0=low, 1=high, or negative error
- * @get_multiple: reads values for multiple signals defined by "mask" and
- *	stores them in "bits", returns 0 on success or negative error
- * @set: assigns output value for signal "offset"
- * @set_multiple: assigns output values for multiple signals defined by "mask"
- * @set_config: optional hook for all kinds of settings. Uses the same
- *	packed config format as generic pinconf.
- * @to_irq: optional hook supporting non-static gpio_to_irq() mappings;
- *	implementation may not sleep
- * @dbg_show: optional routine to show contents in debugfs; default code
- *	will be used when this is omitted, but custom code can show extra
- *	state (such as pullup/pulldown configuration).
- * @init_valid_mask: optional routine to initialize @valid_mask, to be used if
- *	not all GPIOs are valid.
- * @base: identifies the first GPIO number handled by this chip;
- *	or, if negative during registration, requests dynamic ID allocation.
- *	DEPRECATION: providing anything non-negative and nailing the base
- *	offset of GPIO chips is deprecated. Please pass -1 as base to
- *	let gpiolib select the chip base in all possible cases. We want to
- *	get rid of the static GPIO number space in the long run.
- * @ngpio: the number of GPIOs handled by this controller; the last GPIO
- *	handled is (base + ngpio - 1).
- * @names: if set, must be an array of strings to use as alternative
- *      names for the GPIOs in this chip. Any entry in the array
- *      may be NULL if there is no alias for the GPIO, however the
- *      array must be @ngpio entries long.  A name can include a single printk
- *      format specifier for an unsigned int.  It is substituted by the actual
- *      number of the gpio.
- * @can_sleep: flag must be set iff get()/set() methods sleep, as they
- *	must while accessing GPIO expander chips over I2C or SPI. This
- *	implies that if the chip supports IRQs, these IRQs need to be threaded
- *	as the chip access may sleep when e.g. reading out the IRQ status
- *	registers.
- * @read_reg: reader function for generic GPIO
- * @write_reg: writer function for generic GPIO
- * @be_bits: if the generic GPIO has big endian bit order (bit 31 is representing
- *	line 0, bit 30 is line 1 ... bit 0 is line 31) this is set to true by the
- *	generic GPIO core. It is for internal housekeeping only.
- * @reg_dat: data (in) register for generic GPIO
- * @reg_set: output set register (out=high) for generic GPIO
- * @reg_clr: output clear register (out=low) for generic GPIO
- * @reg_dir_out: direction out setting register for generic GPIO
- * @reg_dir_in: direction in setting register for generic GPIO
- * @bgpio_dir_unreadable: indicates that the direction register(s) cannot
- *	be read and we need to rely on out internal state tracking.
- * @bgpio_bits: number of register bits used for a generic GPIO i.e.
- *	<register width> * 8
- * @bgpio_lock: used to lock chip->bgpio_data. Also, this is needed to keep
- *	shadowed and real data registers writes together.
- * @bgpio_data:	shadowed data register for generic GPIO to clear/set bits
- *	safely.
- * @bgpio_dir: shadowed direction register for generic GPIO to clear/set
- *	direction safely. A "1" in this word means the line is set as
- *	output.
+ * struct gpio_chip - abstracts a GPIO controller
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
  * they can all be accessed through a common programing interface.
@@ -324,62 +253,209 @@ struct gpio_irq_chip {
  * is calculated by subtracting @base from the gpio number.
  */
 struct gpio_chip {
+	/**
+	 * @label: a functional name for the GPIO device, such as a part
+	 * number or the name of the SoC IP-block implementing it.
+	 */
 	const char		*label;
+	/**
+	 * @gpiodev: the internal state holder, opaque struct
+	 */
 	struct gpio_device	*gpiodev;
+	/**
+	 * @parent: optional parent device providing the GPIOs
+	 */
 	struct device		*parent;
+	/**
+	 * @owner: helps prevent removal of modules exporting active GPIOs
+	 */
 	struct module		*owner;
 
+	/**
+	 * @request: optional hook for chip-specific activation, such as
+	 * enabling module power and clock; may sleep
+	 */
 	int			(*request)(struct gpio_chip *chip,
 						unsigned offset);
+	/**
+	 * @free: optional hook for chip-specific deactivation, such as
+	 * disabling module power and clock; may sleep
+	 */
 	void			(*free)(struct gpio_chip *chip,
 						unsigned offset);
+	/**
+	 * @get_direction: returns direction for signal "offset", 0=out, 1=in,
+	 * or negative error. It is recommended to always implement this
+	 * function, even on input-only or output-only gpio chips.
+	 */
 	int			(*get_direction)(struct gpio_chip *chip,
 						unsigned offset);
+	/**
+	 * @direction_input: configures signal "offset" as input, or returns
+	 * error. This can be omitted on input-only or output-only gpio chips.
+	 */
 	int			(*direction_input)(struct gpio_chip *chip,
 						unsigned offset);
+	/**
+	 * @direction_output: configures signal "offset" as output, or returns
+	 * error. This can be omitted on input-only or output-only gpio chips.
+	 */
 	int			(*direction_output)(struct gpio_chip *chip,
 						unsigned offset, int value);
+	/**
+	 * @get: returns raw input value for signal "offset", 0=low, 1=high, or
+	 * negative error.
+	 */
 	int			(*get)(struct gpio_chip *chip,
 						unsigned offset);
+	/**
+	 * @get_multiple: reads values for multiple signals defined by "mask"
+	 * and stores them in "bits", returns 0 on success or negative error.
+	 */
 	int			(*get_multiple)(struct gpio_chip *chip,
 						unsigned long *mask,
 						unsigned long *bits);
+	/**
+	 * @set: assigns raw output value for signal "offset", 1=high,
+	 * 0=low.
+	 */
 	void			(*set)(struct gpio_chip *chip,
 						unsigned offset, int value);
+	/**
+	 * @set_multiple: assigns output values for multiple signals defined by
+	 * "mask" according to the value in "bits".
+	 */
 	void			(*set_multiple)(struct gpio_chip *chip,
 						unsigned long *mask,
 						unsigned long *bits);
+	/**
+	 * @set_config: optional hook for all kinds of settings. The "config"
+	 * paramater uses the same packed config format as generic pinconf,
+	 * see <linux/pinctrl/pinconf-generic.h>
+	 */
 	int			(*set_config)(struct gpio_chip *chip,
 					      unsigned offset,
 					      unsigned long config);
+	/**
+	 * @to_irq: optional hook supporting non-static gpio_to_irq() mappings;
+	 * implementation may not sleep. When using the gpio library irqchip
+	 * helpers, this will be assigned by the gpio library.
+	 */
 	int			(*to_irq)(struct gpio_chip *chip,
 						unsigned offset);
-
+	/**
+	 * @dbg_show: optional routine to show contents in debugfs; default
+	 * code will be used when this is omitted, but custom code can show
+	 * extra per-line information.
+	 */
 	void			(*dbg_show)(struct seq_file *s,
 						struct gpio_chip *chip);
-
+	/**
+	 * @init_valid_mask: optional routine to initialize @valid_mask, to be
+	 * used if not all GPIOs are valid for use. A typical case is when
+	 * the BIOS is reserving some GPIO lines.
+	 */
 	int			(*init_valid_mask)(struct gpio_chip *chip,
 						   unsigned long *valid_mask,
 						   unsigned int ngpios);
 
+	/**
+	 * @base: identifies the first GPIO number handled by this chip;
+	 * or, if negative during registration, requests dynamic ID allocation.
+	 *
+	 * DEPRECATION: providing anything non-negative and nailing the base
+	 * offset of GPIO chips is deprecated. Please pass -1 as base to
+	 * let gpiolib select the chip base in all possible cases. We want to
+	 * get rid of the static GPIO number space in the long run.
+	 */
 	int			base;
+	/**
+	 * @ngpio: the number of GPIO lines handled by this controller; the
+	 * last GPIO handled is (base + ngpio - 1). If some lines cannot be
+	 * used, look into using @init_valid_mask.
+	 */
 	u16			ngpio;
+	/**
+	 * @names: if set, must be an array of strings to use as alternative
+	 * names for the GPIO lines in this chip. Any entry in the array
+	 * may be NULL if there is no alias for the GPIO line, however the
+	 * array must be @ngpio entries long.
+	 */
 	const char		*const *names;
+	/**
+	 * @can_sleep: flag must be set if and only if get()/set() methods
+	 * sleep, as they must while accessing GPIO expander chips over for
+	 * example slow buses such as I2C or SPI. This implies that if the chip
+	 * supports IRQs, these IRQs need to be threaded as the chip access
+	 * may sleep when e.g. reading out the IRQ status registers.
+	 */
 	bool			can_sleep;
 
 #if IS_ENABLED(CONFIG_GPIO_GENERIC)
+	/*
+	 * These members are used for generic MMIO gpiochip implementations.
+	 */
+
+	/**
+	 * @read_reg: reader function for generic GPIO
+	 */
 	unsigned long (*read_reg)(void __iomem *reg);
+	/**
+	 * @write_reg: writer function for generic GPIO
+	 */
 	void (*write_reg)(void __iomem *reg, unsigned long data);
+	/**
+	 * @be_bits: if the generic GPIO has big endian bit order (bit 31
+	 * is representing line 0, bit 30 is line 1 ... bit 0 is line 31)
+	 * this is set to true by the generic GPIO core. It is for internal
+	 * housekeeping only.
+	 */
 	bool be_bits;
+	/**
+	 * @reg_dat: data (in) register for generic GPIO
+	 */
 	void __iomem *reg_dat;
+	/**
+	 * @reg_set: output set register (out=high) for generic GPIO
+	 */
 	void __iomem *reg_set;
+	/**
+	 * @reg_clr: output clear register (out=low) for generic GPIO
+	 */
 	void __iomem *reg_clr;
+	/**
+	 * @reg_dir_out: direction out setting register for generic GPIO
+	 */
 	void __iomem *reg_dir_out;
+	/**
+	 * @reg_dir_in: direction in setting register for generic GPIO
+	 */
 	void __iomem *reg_dir_in;
+	/**
+	 * @bgpio_dir_unreadable: indicates that the direction register(s)
+	 * cannot be read and we need to rely on out internal state tracking.
+	 */
 	bool bgpio_dir_unreadable;
+	/**
+	 * @bgpio_bits: number of register bits used for a generic GPIO i.e.
+	 * <register width> * 8
+	 */
 	int bgpio_bits;
+	/**
+	 * @bgpio_lock: used to lock chip->bgpio_data. Also, this is needed to
+	 * keep shadowed and real data registers writes together.
+	 */
 	spinlock_t bgpio_lock;
+	/**
+	 * @bgpio_data:	shadowed data register for generic GPIO to clear/set
+	 * bits safely.
+	 */
 	unsigned long bgpio_data;
+	/**
+	 * @bgpio_dir: shadowed direction register for generic GPIO to
+	 * clear/set direction safely. A "1" in this word means the line is set
+	 * as output.
+	 */
 	unsigned long bgpio_dir;
 #endif /* CONFIG_GPIO_GENERIC */
 
-- 
2.21.0

