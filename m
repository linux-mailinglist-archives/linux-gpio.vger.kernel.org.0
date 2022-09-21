Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A52075BFAAE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 11:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbiIUJUO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 05:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiIUJTX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 05:19:23 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0EE88F969;
        Wed, 21 Sep 2022 02:18:55 -0700 (PDT)
Received: from [IPV6:2001:861:4a40:8620:a389:5c97:17bc:75da] (unknown [IPv6:2001:861:4a40:8620:a389:5c97:17bc:75da])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: gtucker)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E0E606602003;
        Wed, 21 Sep 2022 10:18:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1663751934;
        bh=TpmbfKR5oOSN3loYJOX1gew6MnIuCH87RPRNoyYtJp0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=YVlxAa4kUn7tsOUXl4Uf2WMX25GNRrnoiQBi6VUTWv9FDOk2dnciKduiOUYh/Nnfx
         oVSp2REMNqVL3YxGERj0+0ts8MZ6RDZFFRl5rXxKF9CnwT+D/GzE9SHZTdTs4+oUIr
         PMKG3u5Yc1s5bkxM0wOgK364fHx8m9dDeGJ1ulaMez6B+hw70HGFTKCUgPTQjbgf0f
         srJUXX/C+/vKSZuRefLpa4krJyeqexY/qj57VW6gu+tJiKvaR/dz52ipo1TLsGXffV
         y2uDdOdS+CfDzD+pMWO6wM+V7Y5AEtCIuJp1CFS3vWkPFI9jddkusce8yhKnj1nyKG
         0qGOHgRPfpTrg==
Message-ID: <6354cef8-7740-cd13-1683-eca68f9ec332@collabora.com>
Date:   Wed, 21 Sep 2022 11:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: next/master baseline: 539 runs, 389 regressions (next-20220920)
Content-Language: en-US
To:     festevam@gmail.com
Cc:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        "kernelci@groups.io" <kernelci@groups.io>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <632a0af0.170a0220.966bf.0c66@mx.google.com>
 <CAOMZO5BCGpKVr75qDncDW4-eVLWeDJoPZft5Lh4_ikVHGLb1wQ@mail.gmail.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
In-Reply-To: <CAOMZO5BCGpKVr75qDncDW4-eVLWeDJoPZft5Lh4_ikVHGLb1wQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/09/2022 04:48, Fabio Estevam wrote:
> Hi,
> 
> On Tue, Sep 20, 2022 at 3:48 PM kernelci.org bot <bot@kernelci.org> wrote:
>>
>> next/master baseline: 539 runs, 389 regressions (next-20220920)
> 
> Does anyone know which commit caused such a massive regression?
> 
> Looks like it is gpiod_get_index related.

There's a bisection report, does it look like it?


* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
*                                                               *
* If you do send a fix, please include this trailer:            *
*   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
*                                                               *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

next/master bisection: baseline.login on bcm2836-rpi-2-b

Summary:
  Start:      ef08d387bbbc Add linux-next specific files for 20220920
  Plain log:  https://storage.kernelci.org/next/master/next-20220920/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:   https://storage.kernelci.org/next/master/next-20220920/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Result:     a2b5e207cade gpiolib: rework quirk handling in of_find_gpio()

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       next
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  Branch:     master
  Target:     bcm2836-rpi-2-b
  CPU arch:   arm
  Lab:        lab-collabora
  Compiler:   gcc-10
  Config:     bcm2835_defconfig
  Test case:  baseline.login

Breaking commit found:

-------------------------------------------------------------------------------
commit a2b5e207cade33b4d2dfd920f783f13b1f173e78
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Wed Sep 7 22:39:48 2022 -0700

    gpiolib: rework quirk handling in of_find_gpio()
    
    Instead of having a string of "if" statements let's put all quirks into
    an array and iterate over them.
    
    Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
    Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
    Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 30b89b694530..097e948c1d49 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -372,14 +372,12 @@ EXPORT_SYMBOL_GPL(gpiod_get_from_of_node);
  * properties should be named "foo-gpios" so we have this special kludge for
  * them.
  */
-static struct gpio_desc *of_find_spi_gpio(struct device *dev,
+static struct gpio_desc *of_find_spi_gpio(struct device_node *np,
 					  const char *con_id,
 					  unsigned int idx,
 					  enum of_gpio_flags *of_flags)
 {
 	char prop_name[32]; /* 32 is max size of property name */
-	const struct device_node *np = dev->of_node;
-	struct gpio_desc *desc;
 
 	/*
 	 * Hopefully the compiler stubs the rest of the function if this
@@ -395,8 +393,7 @@ static struct gpio_desc *of_find_spi_gpio(struct device *dev,
 	/* Will be "gpio-sck", "gpio-mosi" or "gpio-miso" */
 	snprintf(prop_name, sizeof(prop_name), "%s-%s", "gpio", con_id);
 
-	desc = of_get_named_gpiod_flags(np, prop_name, idx, of_flags);
-	return desc;
+	return of_get_named_gpiod_flags(np, prop_name, idx, of_flags);
 }
 
 /*
@@ -404,13 +401,11 @@ static struct gpio_desc *of_find_spi_gpio(struct device *dev,
  * lines rather than "cs-gpios" like all other SPI hardware. Account for this
  * with a special quirk.
  */
-static struct gpio_desc *of_find_spi_cs_gpio(struct device *dev,
+static struct gpio_desc *of_find_spi_cs_gpio(struct device_node *np,
 					     const char *con_id,
 					     unsigned int idx,
 					     enum of_gpio_flags *of_flags)
 {
-	const struct device_node *np = dev->of_node;
-
 	if (!IS_ENABLED(CONFIG_SPI_MASTER))
 		return ERR_PTR(-ENOENT);
 
@@ -428,7 +423,7 @@ static struct gpio_desc *of_find_spi_cs_gpio(struct device *dev,
 	 * uses just "gpios" so translate to that when "cs-gpios" is
 	 * requested.
 	 */
-	return of_get_named_gpiod_flags(dev->of_node, "gpios", idx, of_flags);
+	return of_get_named_gpiod_flags(np, "gpios", idx, of_flags);
 }
 
 /*
@@ -436,7 +431,7 @@ static struct gpio_desc *of_find_spi_cs_gpio(struct device *dev,
  * properties should be named "foo-gpios" so we have this special kludge for
  * them.
  */
-static struct gpio_desc *of_find_regulator_gpio(struct device *dev,
+static struct gpio_desc *of_find_regulator_gpio(struct device_node *np,
 						const char *con_id,
 						unsigned int idx,
 						enum of_gpio_flags *of_flags)
@@ -447,8 +442,6 @@ static struct gpio_desc *of_find_regulator_gpio(struct device *dev,
 		"wlf,ldo1ena", /* WM8994 */
 		"wlf,ldo2ena", /* WM8994 */
 	};
-	const struct device_node *np = dev->of_node;
-	struct gpio_desc *desc;
 	int i;
 
 	if (!IS_ENABLED(CONFIG_REGULATOR))
@@ -461,11 +454,10 @@ static struct gpio_desc *of_find_regulator_gpio(struct device *dev,
 	if (i < 0)
 		return ERR_PTR(-ENOENT);
 
-	desc = of_get_named_gpiod_flags(np, con_id, idx, of_flags);
-	return desc;
+	return of_get_named_gpiod_flags(np, con_id, idx, of_flags);
 }
 
-static struct gpio_desc *of_find_arizona_gpio(struct device *dev,
+static struct gpio_desc *of_find_arizona_gpio(struct device_node *np,
 					      const char *con_id,
 					      unsigned int idx,
 					      enum of_gpio_flags *of_flags)
@@ -476,10 +468,10 @@ static struct gpio_desc *of_find_arizona_gpio(struct device *dev,
 	if (!con_id || strcmp(con_id, "wlf,reset"))
 		return ERR_PTR(-ENOENT);
 
-	return of_get_named_gpiod_flags(dev->of_node, con_id, idx, of_flags);
+	return of_get_named_gpiod_flags(np, con_id, idx, of_flags);
 }
 
-static struct gpio_desc *of_find_usb_gpio(struct device *dev,
+static struct gpio_desc *of_find_usb_gpio(struct device_node *np,
 					  const char *con_id,
 					  unsigned int idx,
 					  enum of_gpio_flags *of_flags)
@@ -495,14 +487,27 @@ static struct gpio_desc *of_find_usb_gpio(struct device *dev,
 	if (!con_id || strcmp(con_id, "fcs,int_n"))
 		return ERR_PTR(-ENOENT);
 
-	return of_get_named_gpiod_flags(dev->of_node, con_id, idx, of_flags);
+	return of_get_named_gpiod_flags(np, con_id, idx, of_flags);
 }
 
+typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
+						const char *con_id,
+						unsigned int idx,
+						enum of_gpio_flags *of_flags);
+static const of_find_gpio_quirk of_find_gpio_quirks[] = {
+	of_find_spi_gpio,
+	of_find_spi_cs_gpio,
+	of_find_regulator_gpio,
+	of_find_arizona_gpio,
+	of_find_usb_gpio,
+};
+
 struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			       unsigned int idx, unsigned long *flags)
 {
 	char prop_name[32]; /* 32 is max size of property name */
 	enum of_gpio_flags of_flags;
+	const of_find_gpio_quirk *q;
 	struct gpio_desc *desc;
 	unsigned int i;
 
@@ -522,24 +527,9 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			break;
 	}
 
-	if (gpiod_not_found(desc)) {
-		/* Special handling for SPI GPIOs if used */
-		desc = of_find_spi_gpio(dev, con_id, idx, &of_flags);
-	}
-
-	if (gpiod_not_found(desc))
-		desc = of_find_spi_cs_gpio(dev, con_id, idx, &of_flags);
-
-	if (gpiod_not_found(desc)) {
-		/* Special handling for regulator GPIOs if used */
-		desc = of_find_regulator_gpio(dev, con_id, idx, &of_flags);
-	}
-
-	if (gpiod_not_found(desc))
-		desc = of_find_arizona_gpio(dev, con_id, idx, &of_flags);
-
-	if (gpiod_not_found(desc))
-		desc = of_find_usb_gpio(dev, con_id, idx, &of_flags);
+	/* Properly named GPIO was not found, try workarounds */
+	for (q = of_find_gpio_quirks; gpiod_not_found(desc) && *q; q++)
+		desc = (*q)(dev->of_node, con_id, idx, &of_flags);
 
 	if (IS_ERR(desc))
 		return desc;
-------------------------------------------------------------------------------


Git bisection log:

-------------------------------------------------------------------------------
git bisect start
# good: [521a547ced6477c54b4b0cc206000406c221b4d6] Linux 6.0-rc6
git bisect good 521a547ced6477c54b4b0cc206000406c221b4d6
# bad: [ef08d387bbbc20df740ced8caee0ffac835869ac] Add linux-next specific files for 20220920
git bisect bad ef08d387bbbc20df740ced8caee0ffac835869ac
# good: [df970c033333b10c728198606fe787535e08ab8a] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
git bisect good df970c033333b10c728198606fe787535e08ab8a
# good: [c46ae7d9b6ad0283ffd7b40117b52444d68e083e] Merge branch 'usb-next' of git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git
git bisect good c46ae7d9b6ad0283ffd7b40117b52444d68e083e
# bad: [3a477fd4c8bc8c345f2e18d340a4a419b06f4560] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git
git bisect bad 3a477fd4c8bc8c345f2e18d340a4a419b06f4560
# good: [bc919f14c398c74a19d0c5258db3c8938030d5f1] Merge branch 'next' of git://github.com/awilliam/linux-vfio.git
git bisect good bc919f14c398c74a19d0c5258db3c8938030d5f1
# good: [4ca3827f7c5f3908695a866ebfcc965adefc18ef] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git
git bisect good 4ca3827f7c5f3908695a866ebfcc965adefc18ef
# good: [d16c7c70975bb3891b0e6d72575f1e0a9db74d56] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
git bisect good d16c7c70975bb3891b0e6d72575f1e0a9db74d56
# good: [6e6e1ef6b59d70c289f899d46049ab54bcf3f9c4] dt-bindings: pinctrl: qcom,sm8250-pinctrl: do not require function on non-GPIOs
git bisect good 6e6e1ef6b59d70c289f899d46049ab54bcf3f9c4
# bad: [acb44334b112808bb6fdecf57f365060939cda17] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
git bisect bad acb44334b112808bb6fdecf57f365060939cda17
# good: [ce0cb8fb967ec62ff000826fd469511ee2d3fcb2] dt-bindings: vendor-prefixes: add Diodes
git bisect good ce0cb8fb967ec62ff000826fd469511ee2d3fcb2
# good: [c6074f3fcf8b67acf8e3bdf678ace1f9c18dfb9e] gpio: 104-idio-16: Ensure number of irq matches number of base
git bisect good c6074f3fcf8b67acf8e3bdf678ace1f9c18dfb9e
# bad: [a2b5e207cade33b4d2dfd920f783f13b1f173e78] gpiolib: rework quirk handling in of_find_gpio()
git bisect bad a2b5e207cade33b4d2dfd920f783f13b1f173e78
# good: [98c3c940ea5c3957056717e8b77a91c7d94536ad] gpiolib: of: do not ignore requested index when applying quirks
git bisect good 98c3c940ea5c3957056717e8b77a91c7d94536ad
# good: [984914ec4f4bfa9ee8f067b06293bc12bef20137] gpiolib: of: make Freescale SPI quirk similar to all others
git bisect good 984914ec4f4bfa9ee8f067b06293bc12bef20137
# first bad commit: [a2b5e207cade33b4d2dfd920f783f13b1f173e78] gpiolib: rework quirk handling in of_find_gpio()
-------------------------------------------------------------------------------


>> Regressions Summary
>> -------------------
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> at91sam9g20ek                | arm   | lab-broonie     | clang-16 | multi_v5_defconfig           | 1
>> bcm2711-rpi-4-b              | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835_defconfig            | 1
>> bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835_defconfig            | 1
>> bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>> beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v7_defconfig           | 1
>> beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> da850-lcdk                   | arm   | lab-baylibre    | clang-16 | multi_v5_defconfig           | 1
>> da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci_all_defconfig        | 1
>> fsl-ls1028a-rdb              | arm64 | lab-nxp         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> fsl-ls1028a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> fsl-ls1028a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig                    | 1
>> fsl-ls1028a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+ima                | 1
>> fsl-ls1028a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+videodec           | 1
>> fsl-ls1043a-rdb              | arm64 | lab-nxp         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig                    | 1
>> fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+ima                | 1
>> fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+videodec           | 1
>> hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-10   | defconfig                    | 1
>> imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>> imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>> imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v7_defconfig           | 1
>> imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>> imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v7_defconfig           | 1
>> imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v7_defconfig           | 1
>> imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v7_defconfig           | 1
>> imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v7_defconfig           | 1
>> imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> imx8mn-ddr4-evk              | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> imx8mn-ddr4-evk              | arm64 | lab-nxp         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconfig                    | 1
>> imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconfig+ima                | 1
>> imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconfig+videodec           | 1
>> imx8mp-evk                   | arm64 | lab-nxp         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconfig                    | 1
>> imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconfig+ima                | 1
>> imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconfig+videodec           | 1
>> jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
>> jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_defconfig              | 1
>> juno-uboot                   | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> juno-uboot                   | arm64 | lab-broonie     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> juno-uboot                   | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>> juno-uboot                   | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>> juno-uboot                   | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>> kontron-kbox-a-230-ls        | arm64 | lab-kontron     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconfig                    | 1
>> kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconfig+ima                | 1
>> kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconfig+videodec           | 1
>> kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v7_defconfig           | 1
>> kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconfig                    | 1
>> kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconfig+ima                | 1
>> kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconfig+videodec           | 1
>> kontron-sl28-var3-ads2       | arm64 | lab-kontron     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconfig                    | 1
>> kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconfig+ima                | 1
>> kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconfig+videodec           | 1
>> meson-g12a-sei510            | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson-g12a-u200              | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-g12a-x96-max           | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconfig                    | 1
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconfig+ima                | 1
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconfig+videodec           | 1
>> meson-g12b-odroid-n2         | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-gxbb-p200              | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconfig+videodec           | 1
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson-gxm-q200               | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-sm1-sei610             | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>> mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>> odroid-xu3                   | arm   | lab-collabora   | gcc-10   | exynos_defconfig             | 1
>> odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>> odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
>> odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> panda                        | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> panda                        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> panda                        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> qcom-qdf2400                 | arm64 | lab-linaro-lkft | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconfig+arm64-chromebook   | 1
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>> qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>> qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconfig                    | 1
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconfig+arm64-chromebook   | 1
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>> qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>> qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconfig                    | 1
>> qemu_riscv64                 | riscv | lab-baylibre    | gcc-10   | defconfig                    | 1
>> qemu_riscv64                 | riscv | lab-broonie     | gcc-10   | defconfig                    | 1
>> qemu_riscv64                 | riscv | lab-collabora   | gcc-10   | defconfig                    | 1
>> r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconfig+arm64-chromebook   | 1
>> r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconfig                    | 1
>> r8a774c0-ek874               | arm64 | lab-cip         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconfig+arm64-chromebook   | 1
>> r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconfig                    | 1
>> r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconfig+ima                | 1
>> r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconfig+videodec           | 1
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>> rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
>> rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>> rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
>> rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>> rk3399-roc-pc                | arm64 | lab-clabbe      | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>> rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>> rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconfig+videodec           | 1
>> rk3399-rock-pi-4b            | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconfig                    | 1
>> rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconfig+ima                | 1
>> rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconfig+videodec           | 1
>> sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>> sun4i-a10-olinuxino-lime     | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> sun4i-a10-olinuxino-lime     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun4i-a10-olinuxino-lime     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>> sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>> sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconfig+videodec           | 1
>> sun50i-a64-pine64-plus       | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-a64-pine64-plus       | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>> sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>> sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>> sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>> sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>> sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>> sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>> sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>> sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>> sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconfig+videodec           | 1
>> sun50i-h6-pine-h64           | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-h6-pine-h64           | arm64 | lab-clabbe      | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-h6-pine-h64           | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>> sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>> sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>> sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>> sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>> sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconfig+videodec           | 1
>> sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconfig                    | 1
>> sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconfig+ima                | 1
>> sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconfig+videodec           | 1
>> sun5i-a13-olinuxino-micro    | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> sun5i-a13-olinuxino-micro    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun5i-a13-olinuxino-micro    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v7_defconfig           | 1
>> sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v7_defconfig           | 1
>> sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>> sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v7_defconfig           | 1
>> sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v7_defconfig           | 1
>> sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...BIG_ENDIAN=y | 1
>> tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>> tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
>> tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>> tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>> tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_defconfig              | 1
>> zynqmp-zcu102                | arm64 | lab-cip         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>> zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>> zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconfig+arm64-chromebook   | 1
>> zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconfig                    | 1
>> zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconfig+ima                | 1
>> zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20220920/plan/baseline/
>>
>>   Test:     baseline
>>   Tree:     next
>>   Branch:   master
>>   Describe: next-20220920
>>   URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>   SHA:      ef08d387bbbc20df740ced8caee0ffac835869ac
>>
>>
>> Test Regressions
>> ----------------
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d601794c768479355665
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d601794c768479355666
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7bba73252bfe935565d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7bba73252bfe935565e
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d81fc8955189c7355656
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d81fc8955189c7355657
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> at91sam9g20ek                | arm   | lab-broonie     | clang-16 | multi_v5_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d24213e0500ba8355655
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v5_defconfig
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v5_defconfig/clang-16/lab-broonie/baseline-at91sam9g20ek.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v5_defconfig/clang-16/lab-broonie/baseline-at91sam9g20ek.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d24213e0500ba8355656
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> bcm2711-rpi-4-b              | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3f125ff50004b35565e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-bcm2711-rpi-4-b.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-bcm2711-rpi-4-b.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3f125ff50004b35565f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835_defconfig            | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d4be9d0876448f355648
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: bcm2835_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d4be9d0876448f355649
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835_defconfig            | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6985a85016b23355649
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: bcm2835_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6985a85016b2335564a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dd8d83094b1d7f355648
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dd8d83094b1d7f355649
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d9ff23b1650fa9355674
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-beagle-xm.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-beagle-xm.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d9ff23b1650fa9355675
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d78e5f84324bc3355681
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d78e5f84324bc3355682
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d856e89acf867f35565b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-beaglebone-black.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-beaglebone-black.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d856e89acf867f35565c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8ba8f22479a74355652
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-beaglebone-black.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-beaglebone-black.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8ba8f22479a74355653
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d4483241d904b0355678
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d4483241d904b0355679
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8e443ea8b82b7355654
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-cip/baseline-beaglebone-black.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-cip/baseline-beaglebone-black.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8e443ea8b82b7355655
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d9ab264193956235566c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-cip/baseline-beaglebone-black.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-cip/baseline-beaglebone-black.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d9ab264193956235566d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d920d883f4e90435564d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d920d883f4e90435564e
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dbf0af83e2a95a355660
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-cubietruck.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-cubietruck.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dbf0af83e2a95a355661
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dd277cb049c830355651
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-cubietruck.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-cubietruck.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dd277cb049c830355652
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> da850-lcdk                   | arm   | lab-baylibre    | clang-16 | multi_v5_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1301caacca410355679
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v5_defconfig
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v5_defconfig/clang-16/lab-baylibre/baseline-da850-lcdk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v5_defconfig/clang-16/lab-baylibre/baseline-da850-lcdk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1301caacca41035567a
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci_all_defconfig        | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1ae83fd79895035567a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: davinci_all_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1ae83fd79895035567b
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> fsl-ls1028a-rdb              | arm64 | lab-nxp         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d4418742fe2deb355678
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-nxp/baseline-fsl-ls1028a-rdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-nxp/baseline-fsl-ls1028a-rdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d4418742fe2deb355679
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> fsl-ls1028a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d26bee6084f4e5355658
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d26bee6084f4e5355659
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> fsl-ls1028a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d69b0c6cd5b1c9355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d69b0c6cd5b1c9355643
>>         failing since 4 days (last pass: next-20220912, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> fsl-ls1028a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7654369c82f0d35565e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7654369c82f0d35565f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> fsl-ls1028a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d89f96f1335b8b355655
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d89f96f1335b8b355656
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> fsl-ls1043a-rdb              | arm64 | lab-nxp         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3f325ff50004b355662
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-nxp/baseline-fsl-ls1043a-rdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-nxp/baseline-fsl-ls1043a-rdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3f325ff50004b355663
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d266de4b70f868355674
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d266de4b70f868355675
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7749371b7ea4a355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7749371b7ea4a355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d83ca60c3bda0035565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d83ca60c3bda0035565b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d9423fceb7390035566e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d9423fceb7390035566f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d51997c04d669a355683
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/riscv/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/riscv/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d51997c04d669a355684
>>         failing since 8 days (last pass: next-20220908, first fail: next-20220912)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d459159fe85a53355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d459159fe85a53355643
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d63b580f0e485c3556bb
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d63b580f0e485c3556bc
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d72cf9f5b51135355672
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d72cf9f5b51135355673
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d4583e871274f4355657
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d4583e871274f4355658
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5fa9b0e6a868f3556a5
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5fa9b0e6a868f3556a6
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-sabrelite              | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6feab22c4e83a355647
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6feab22c4e83a355648
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d483af4e9d1ce835564d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6q-sabresd.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6q-sabresd.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d483af4e9d1ce835564e
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d762990292cd5f35566e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-nxp/baseline-imx6q-sabresd.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-nxp/baseline-imx6q-sabresd.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d762990292cd5f35566f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-sabresd                | arm   | lab-nxp         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7c5b23f3c84f5355651
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-nxp/baseline-imx6q-sabresd.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-nxp/baseline-imx6q-sabresd.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7c5b23f3c84f5355652
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d45b84c2a6441035565e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d45b84c2a6441035565f
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d63d580f0e485c3556c2
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-imx6q-udoo.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d63d580f0e485c3556c3
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7de58287db9e635564d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-imx6q-udoo.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7de58287db9e635564e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d53d8d2db002e5355658
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d53d8d2db002e5355659
>>         new failure (last pass: next-20220718)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6e6c15a56a3db355667
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6e6c15a56a3db355668
>>         new failure (last pass: next-20220719)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d84a9b69aba70c355651
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d84a9b69aba70c355652
>>         new failure (last pass: next-20220719)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d492353c52d6b1355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d493353c52d6b1355643
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d60ef96821094a355662
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d60ef96821094a355663
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d752990292cd5f355644
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-nxp/baseline-imx6sx-sdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-nxp/baseline-imx6sx-sdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d752990292cd5f355645
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d47dc722ef619f355720
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d47dc722ef619f355721
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d620f8f85ae4f335566a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d620f8f85ae4f335566b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d74d6b9506de0135566d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d74d6b9506de0135566e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d469fafd4400d73556ec
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d469fafd4400d73556ed
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5fc9b0e6a868f3556a8
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-nxp/baseline-imx7d-sdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5fc9b0e6a868f3556a9
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d74f6b9506de0135567f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-nxp/baseline-imx7d-sdb.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d74f6b9506de01355680
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d480c722ef619f355736
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d480c722ef619f355737
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d611f96821094a355665
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d611f96821094a355666
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d76787646d11e935568a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d76787646d11e935568b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mn-ddr4-evk              | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d454da7b498413355689
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-imx8mn-ddr4-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d454da7b49841335568a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mn-ddr4-evk              | arm64 | lab-nxp         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d420d5bc1194ac35566e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-nxp/baseline-imx8mn-ddr4-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-nxp/baseline-imx8mn-ddr4-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d420d5bc1194ac35566f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d38c0e9cbaf9ea355675
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d38c0e9cbaf9ea355676
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7ecce0946fc5b35565d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7ecce0946fc5b35565e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d9402ecaea387735565c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d9402ecaea387735565d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mn-ddr4-evk              | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329db99213cb0f998355653
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329db99213cb0f998355654
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d29b4ee2b41d4435564b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d29b4ee2b41d4435564c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5da5019422ee035566d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5da5019422ee035566e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6c3c6bddcac01355663
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6c3c6bddcac01355664
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d867d0684b10fb35564e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d867d0684b10fb35564f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mp-evk                   | arm64 | lab-nxp         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d41d779fc8e68b35567d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-nxp/baseline-imx8mp-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-nxp/baseline-imx8mp-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d41d779fc8e68b35567e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d268c016078950355652
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-nxp/baseline-imx8mp-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d268c016078950355653
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6855d6b7da83b35564c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6855d6b7da83b35564d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6fd47f646bfb935564e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6fd47f646bfb935564f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> imx8mp-evk                   | arm64 | lab-nxp         | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d878be2191ab80355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d878be2191ab80355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d84c9b69aba70c355654
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d84c9b69aba70c355655
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8cece0dcafd1035566a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-10/lab-baylibre/baseline-jetson-tk1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8cece0dcafd1035566b
>>         failing since 161 days (last pass: next-20220401, first fail: next-20220411)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dab2437e17cde0355663
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-jetson-tk1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dab2437e17cde0355664
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329de38f79eefc95a35565f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-jetson-tk1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329de38f79eefc95a355660
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_defconfig              | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d53605c0b033c8355659
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: tegra_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d53605c0b033c835565a
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> juno-uboot                   | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d500ac9bb36b8935568e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-juno-uboot.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-juno-uboot.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d500ac9bb36b8935568f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> juno-uboot                   | arm64 | lab-broonie     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d34635f2034a00355658
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-broonie/baseline-juno-uboot.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-broonie/baseline-juno-uboot.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d34635f2034a00355659
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> juno-uboot                   | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d90f13d2b84ef9355648
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d90f13d2b84ef9355649
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> juno-uboot                   | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d9ec23b1650fa935566e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-juno-uboot.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-juno-uboot.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d9ec23b1650fa935566f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> juno-uboot                   | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dba337ee7e2681355648
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-juno-uboot.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-juno-uboot.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dba337ee7e2681355649
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-kbox-a-230-ls        | arm64 | lab-kontron     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d42e013f048b8f355653
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-kontron/baseline-kontron-kbox-a-230-ls.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d42e013f048b8f355654
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d277ee6084f4e5355673
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d277ee6084f4e5355674
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d73a78af590b24355654
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d73a78af590b24355655
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d83ea60c3bda00355661
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d83ea60c3bda00355662
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d88eecb64e14b3355664
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d88eecb64e14b3355665
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5aaecc2f1ee8d355644
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2gs.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2gs.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5aaecc2f1ee8d355645
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7b265f960eefa35564f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2gs.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2gs.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7b265f960eefa355650
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d96bbd4e95a1fd355656
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2gs.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2gs.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d96bbd4e95a1fd355657
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d456da7b49841335568f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-kontron/baseline-kontron-pitx-imx8m.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-kontron/baseline-kontron-pitx-imx8m.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d456da7b498413355690
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1d5563ed244d435565c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1d5563ed244d435565d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d712676c13be90355666
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d712676c13be90355667
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d76387646d11e9355684
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d76387646d11e9355685
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8cace0dcafd10355664
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8cace0dcafd10355665
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-sl28-var3-ads2       | arm64 | lab-kontron     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3b7e990f076ac355659
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-kontron/baseline-kontron-sl28-var3-ads2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3b7e990f076ac35565a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1ec49f0076656355673
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1ec49f0076656355674
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d672b74e9829be355649
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d672b74e9829be35564a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7502af1e16349355671
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7502af1e16349355672
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d81602d2016cc8355697
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d81602d2016cc8355698
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-sei510            | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d38b9917f8fbd0355672
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-g12a-sei510.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-g12a-sei510.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d38b9917f8fbd0355673
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1bfcc976ed8223556d9
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1bfcc976ed8223556da
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d56d052aa66e8535565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d56d052aa66e8535565b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6715e88e28410355679
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6715e88e2841035567a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d814fcb262a327355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d814fcb262a327355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-u200              | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3c418fb24dd8c355659
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-g12a-u200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-g12a-u200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3c418fb24dd8c35565a
>>         failing since 1 day (last pass: next-20220908, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d22e2871a784ae355669
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d22e2871a784ae35566a
>>         new failure (last pass: next-20220912)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5d99c2aa2869c35565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5d99c2aa2869c35565b
>>         failing since 1 day (last pass: next-20220912, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6b33726f57e7435567d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6b33726f57e7435567e
>>         failing since 1 day (last pass: next-20220908, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-x96-max           | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d38cca26bdc87b35566a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-g12a-x96-max.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-g12a-x96-max.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d38cca26bdc87b35566b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d232006ec8685c355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d232006ec8685c355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d57f856e05c71b355655
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d57f856e05c71b355656
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d685635c5071e3355666
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d685635c5071e3355667
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d815c8955189c735564b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d815c8955189c735564c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3db3c54500045355673
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3db3c54500045355674
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d865d0684b10fb355645
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d865d0684b10fb355646
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1d6563ed244d435566b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1d6563ed244d435566c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329db6b5698fac25e35565c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329db6b5698fac25e35565d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dbb837ee7e268135565c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dbb837ee7e268135565d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e0a9da670117e835566f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e0a9da670117e8355670
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8a1be2191ab80355668
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8a1be2191ab80355669
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329df96455feb31a0355687
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329df96455feb31a0355688
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e0ae0bba1b9baa35565f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e0ae0bba1b9baa355660
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e4bf23d4e24ce6355683
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e4bf23d4e24ce6355684
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-odroid-n2         | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d404bbe0cdc4af355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-g12b-odroid-n2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d404bbe0cdc4af355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d235c89fded12d355666
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d235c89fded12d355667
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329da5896c6f96bc935565b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329da5896c6f96bc935565c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329da949612fcd42a35569b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329da949612fcd42a35569c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dd297cb049c83035565f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dd297cb049c830355660
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1f1f62610f2ef355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1f1f62610f2ef355643
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5a36cbf6dd5c3355665
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5a36cbf6dd5c3355666
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d658f352cc84cf355659
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d658f352cc84cf35565a
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6a93726f57e74355654
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6a93726f57e74355655
>>         new failure (last pass: next-20220719)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxbb-p200              | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d51deeb9414a45355672
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxbb-p200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxbb-p200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d51deeb9414a45355673
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d24cf0b79b66c33556ef
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d24cf0b79b66c33556f0
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dbeaaf83e2a95a35565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dbeaaf83e2a95a35565b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dcee3d9758c251355667
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dcee3d9758c251355668
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329de6ac39674e51635565d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329de6ac39674e51635565e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e1ef71b55a2e3935564d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e1ef71b55a2e3935564e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1ee49f0076656355687
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1ee49f0076656355688
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5afdd7c9cf05a355644
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5afdd7c9cf05a355645
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6685e88e2841035565d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6685e88e2841035565e
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6c9847d888fbc355654
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6c9847d888fbc355655
>>         new failure (last pass: next-20220719)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d4064075c1705635564a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxl-s905d-p230.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d4064075c1705635564b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d23913e0500ba8355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d23913e0500ba8355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6632eb367588c355650
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6632eb367588c355651
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6ebced109e49c35565b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6ebced109e49c35565c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7543a6fe6d82f35565f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7543a6fe6d82f355660
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8d0876ec0712f35564d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8d0876ec0712f35564e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3c118fb24dd8c355656
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3c118fb24dd8c355657
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1f08caa67e8d335564d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1f08caa67e8d335564e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d654f352cc84cf35564a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d654f352cc84cf35564b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6a60c6cd5b1c935564f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6a60c6cd5b1c9355650
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6f53093f76495355650
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6f53093f76495355651
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d865d0684b10fb355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d865d0684b10fb355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3a45beb1a4f3535568f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3a45beb1a4f35355690
>>         failing since 0 day (last pass: next-20220822, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3d69edfdc9c0a355654
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3d69edfdc9c0a355655
>>         failing since 0 day (last pass: next-20220822, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3c660aa93c3b935565d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3c660aa93c3b935565e
>>         failing since 0 day (last pass: next-20220822, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d24713e0500ba835565c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d24713e0500ba835565d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329de4d0db0f71ca9355650
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329de4d0db0f71ca9355651
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e07676c8051011355665
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e07676c8051011355666
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e0f750297fb1d735565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e0f750297fb1d735565b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e378d305dca52f355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e378d305dca52f355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d20bf62610f2ef355684
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d20bf62610f2ef355685
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5dd9c2aa2869c355660
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5de9c2aa2869c355661
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6cd999785eeed35574b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6cd999785eeed35574c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d73260a71ed090355650
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d73260a71ed090355651
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d861ac83c3e3ae355664
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d861ac83c3e3ae355665
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d2842f5b3f7938355680
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d2842f5b3f7938355681
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d66eb74e9829be355646
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d66eb74e9829be355647
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d75d3a6fe6d82f35566f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d75d3a6fe6d82f355670
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7d59cc63738b635565b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7d59cc63738b635565c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329da060352f3bd14355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329da060352f3bd14355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3a24bf80b173d355655
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3a24bf80b173d355656
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1ecf9ac067f2335564b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1ecf9ac067f2335564c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5a561c7e3f6b035566a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5a561c7e3f6b035566b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6c7999785eeed355747
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6c7999785eeed355748
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d73b2af1e16349355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d73b2af1e16349355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d84fe89acf867f355649
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d84fe89acf867f35564a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-q200               | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e4be0fc3b3d07f35566a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxm-q200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-gxm-q200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e4be0fc3b3d07f35566b
>>         failing since 3 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e0c23da7574e053556a1
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e0c23da7574e053556a2
>>         failing since 3 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329f53de9eeae9d94355657
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329f53de9eeae9d94355658
>>         failing since 3 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329f8ae503d40744635566a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329f8ae503d40744635566b
>>         failing since 3 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329fbced54fa449b635564e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329fbced54fa449b635564f
>>         failing since 3 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-gxm-q200               | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/632a0710845e425bee3556ad
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/632a0710845e425bee3556ae
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d4126fa7581cf5355667
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d4126fa7581cf5355668
>>         failing since 1 day (last pass: next-20220908, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d25706ab68e70a355675
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d25706ab68e70a355676
>>         new failure (last pass: next-20220912)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6462c842b592d355666
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6462c842b592d355667
>>         failing since 1 day (last pass: next-20220912, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6dbc15a56a3db355647
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6dbc15a56a3db355648
>>         failing since 1 day (last pass: next-20220912, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d780622793ca7a35565e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d780622793ca7a35565f
>>         failing since 1 day (last pass: next-20220908, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-sm1-sei610             | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3b4e990f076ac355656
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-sm1-sei610.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-meson-sm1-sei610.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3b4e990f076ac355657
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d24df0b79b66c33556f2
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d24df0b79b66c33556f3
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5939fe4b9c58635564c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5939fe4b9c58635564d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6841e5d54773535564a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6841e5d54773535564b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d816c8955189c7355651
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d816c8955189c7355652
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d540c43a3d46d635568b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d540c43a3d46d635568c
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5d961e03e7c6735566a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5d961e03e7c6735566b
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> meson8b-odroidc1             | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d713dbce85b4b1355655
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-meson8b-odroidc1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d713dbce85b4b1355656
>>         new failure (last pass: next-20220722)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d70b847d888fbc355661
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8173-elm-hana.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d70b847d888fbc355662
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d43b741e7da25635565f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d43b741e7da256355660
>>         failing since 96 days (last pass: next-20220610, first fail: next-20220616)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> odroid-xu3                   | arm   | lab-collabora   | gcc-10   | exynos_defconfig             | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d56cfda2de410935564c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: exynos_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d56cfda2de410935564d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329debae80873bbf835565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329debae80873bbf835565b
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e2f2a2a548095a355694
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-10/lab-collabora/baseline-odroid-xu3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-10/lab-collabora/baseline-odroid-xu3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e2f2a2a548095a355695
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329ea50ec27444af2355675
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-odroid-xu3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-odroid-xu3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329ea50ec27444af2355676
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> odroid-xu3                   | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329ed34fcdaca4f0035568a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-odroid-xu3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-odroid-xu3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329ed34fcdaca4f0035568b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> panda                        | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5bd81a80801cd35569b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5bd81a80801cd35569c
>>         new failure (last pass: next-20220831)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> panda                        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d81502d2016cc8355694
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-panda.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-panda.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d81502d2016cc8355695
>>         new failure (last pass: next-20220831)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> panda                        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d9a62641939562355666
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-panda.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-panda.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d9a62641939562355667
>>         new failure (last pass: next-20220831)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qcom-qdf2400                 | arm64 | lab-linaro-lkft | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7e8f49013b9b6355648
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-linaro-lkft/baseline-qcom-qdf2400.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-linaro-lkft/baseline-qcom-qdf2400.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7e8f49013b9b6355649
>>         failing since 5 days (last pass: next-20220908, first fail: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qcom-qdf2400                 | arm64 | lab-linaro-lkft | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d569d3bb4aca78355645
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d569d3bb4aca78355646
>>         failing since 8 days (last pass: next-20220908, first fail: next-20220912)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8e743ea8b82b7355662
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8e743ea8b82b7355663
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329daca8012091902355646
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329daca8012091902355647
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc591b72dce08535567b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc591b72dce08535567c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6391ecdc54d3e35567c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6391ecdc54d3e35567d
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8a68f22479a74355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8a68f22479a74355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329daea37402ec2c9355676
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329daea37402ec2c9355677
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d62f580f0e485c35564b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d62f580f0e485c35564c
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7a3fdda2e7f54355643
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7a3fdda2e7f54355644
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d90d8b2001978035564a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d90d8b2001978035564b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d93c2ecaea3877355657
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d93c2ecaea3877355658
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329db06515a2b8153355658
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329db06515a2b8153355659
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc471b72dce085355661
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc471b72dce085355662
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d702ab22c4e83a355651
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d702ab22c4e83a355652
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8bb27d08ec7a4355658
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8bb27d08ec7a4355659
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dad737402ec2c9355659
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dad737402ec2c935565a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6785e88e2841035567e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6785e88e2841035567f
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7d49cc63738b6355658
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7d49cc63738b6355659
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d93a5cc755cc46355644
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d93a5cc755cc46355645
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329db217668aeb41d355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329db217668aeb41d355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc5b1b72dce085355681
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc5b1b72dce085355682
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6c60a7ab444ae3556b3
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6c60a7ab444ae3556b4
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8ba8f22479a7435564f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8ba8f22479a74355650
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dafd515a2b8153355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dafd515a2b8153355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6645e88e2841035564d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6645e88e2841035564e
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7b8326771f4d635564b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7b8326771f4d635564c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d9238b2001978035568f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d9238b20019780355690
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dae137402ec2c9355662
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dae137402ec2c9355663
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc6e8b451737d435566b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc6e8b451737d435566c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7040e3738e662355653
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7040e3738e662355654
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8a796f1335b8b355660
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8a796f1335b8b355661
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329db25be5d865975355665
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329db25be5d865975355666
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6aa3726f57e74355657
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6aa3726f57e74355658
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7bf73bcfedfe4355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7bf73bcfedfe4355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d588d3bb4aca7835568b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d588d3bb4aca7835568c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d4dcae1f80fa2335564e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d4dcae1f80fa2335564f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d2b4199e99fe1c355683
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d2b4199e99fe1c355684
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6c5847d888fbc35564f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6c5847d888fbc355650
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d855e89acf867f355658
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d855e89acf867f355659
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329da4996c6f96bc9355643
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329da4996c6f96bc9355644
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc668b451737d4355654
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc668b451737d4355655
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d217146087ee2d355647
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d217146087ee2d355648
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6931e5d547735355665
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6931e5d547735355666
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d767d59d01708035565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d767d59d01708035565b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d586856e05c71b35565d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d586856e05c71b35565e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d4c7177c315fac35564c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d4c7177c315fac35564d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d28c8ec3f3013535566d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d28c8ec3f3013535566e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d68a2be30e072d35576e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d68a2be30e072d35576f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d857e89acf867f35565e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d857e89acf867f35565f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329da5db7fb058e8b355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329da5eb7fb058e8b355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dca3e99e3eef7d355659
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dca3e99e3eef7d35565a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d21e2871a784ae35565e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d21e2871a784ae35565f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6571921315344355650
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6571921315344355651
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d77bd59d01708035566e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d77bd59d01708035566f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_riscv64                 | riscv | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329da64f00c824ecc35565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/riscv/defconfig/gcc-10/lab-baylibre/baseline-qemu_riscv64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/riscv/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329da64f00c824ecc35565b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_riscv64                 | riscv | lab-broonie     | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7b8b23f3c84f535564c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/riscv/defconfig/gcc-10/lab-broonie/baseline-qemu_riscv64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/riscv/defconfig/gcc-10/lab-broonie/baseline-qemu_riscv64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/riscv/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7b8b23f3c84f535564d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> qemu_riscv64                 | riscv | lab-collabora   | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d703dbce85b4b1355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_riscv64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/riscv/defconfig/gcc-10/lab-collabora/baseline-qemu_riscv64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/riscv/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d703dbce85b4b1355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d9343fceb7390035564e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d9343fceb7390035564f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dd8067676e47a7355655
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dd8067676e47a7355656
>>         failing since 1 day (last pass: next-20220908, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a774c0-ek874               | arm64 | lab-cip         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3d45b9c60dcec355643
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-cip/baseline-r8a774c0-ek874.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-cip/baseline-r8a774c0-ek874.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3d45b9c60dcec355644
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d25988c24162e0355649
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d25988c24162e035564a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d460fe2fcaa5e4355646
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d460fe2fcaa5e4355647
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5c86583930a80355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5c86583930a80355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6ba0a7ab444ae355650
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6ba0a7ab444ae355651
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d834fcb262a3273556dd
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d834fcb262a3273556de
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d51beeb9414a4535566e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-r8a77950-salvator-x.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-r8a77950-salvator-x.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d51beeb9414a4535566f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d25ffc10d89ac9355660
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d25ffc10d89ac9355661
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329da80b7fb058e8b355680
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329da80b7fb058e8b355681
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329db34dfebbde580355645
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329db34dfebbde580355646
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dbe874c8b6faa9355654
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dbe874c8b6faa9355655
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329de9009b62ff9bc355678
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329de9009b62ff9bc355679
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d56efda2de4109355655
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d56efda2de4109355656
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d83e033bfcf5923556e8
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d83e033bfcf5923556e9
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dac3bef930a3fa355671
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dac3bef930a3fa355672
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dbfd7e953c3830355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-rk3288-rock2-square.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dbfd7e953c3830355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329db99213cb0f998355656
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329db99213cb0f998355657
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc759d2fe577c0355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc759d2fe577c0355643
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e27b7070e4ee90355657
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e27b7070e4ee90355658
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e2a89027da7fcf3556d0
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e2a89027da7fcf3556d1
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d67eb74e9829be35564f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d67eb74e9829be355650
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-roc-pc                | arm64 | lab-clabbe      | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3b05beb1a4f353556b9
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-clabbe/baseline-rk3399-roc-pc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-clabbe/baseline-rk3399-roc-pc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3b05beb1a4f353556ba
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1eb0456d506d2355680
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1eb0456d506d2355681
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5a66cbf6dd5c335566a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5a66cbf6dd5c335566b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6a15d6b7da83b355679
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6a15d6b7da83b35567a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d9cde0bd3fd15d355659
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d9cde0bd3fd15d35565a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-rock-pi-4b            | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3dde8de3af69f3556c0
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-rk3399-rock-pi-4b.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-rk3399-rock-pi-4b.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3dde8de3af69f3556c1
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1fcf62610f2ef355651
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1fcf62610f2ef355652
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5a96c08db9858355646
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5a96c08db9858355647
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6c2999785eeed355741
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6c2999785eeed355742
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d829a60c3bda00355646
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d829a60c3bda00355647
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d66b2eb367588c35565b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-lazor-limozeen.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-sc7180-trogdor-lazor-limozeen.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d66b2eb367588c35565c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun4i-a10-olinuxino-lime     | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dfaa48eb71b65f355671
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dfaa48eb71b65f355672
>>         new failure (last pass: next-20220831)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun4i-a10-olinuxino-lime     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e54c0c0eaa6819355669
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e54c0c0eaa681935566a
>>         new failure (last pass: next-20220831)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun4i-a10-olinuxino-lime     | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e6a0a8aad73156355647
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun4i-a10-olinuxino-lime.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e6a0a8aad73156355648
>>         new failure (last pass: next-20220831)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5b8ce33e996f2355653
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5b8ce33e996f2355654
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6a96a3fc8311a355648
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6a96a3fc8311a355649
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d876d0684b10fb355666
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d876d0684b10fb355667
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-pine64-plus       | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6fe47f646bfb9355651
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6fe47f646bfb9355652
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3d53c5450004535566c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-sun50i-a64-pine64-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3d53c5450004535566d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-pine64-plus       | arm64 | lab-baylibre    | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d38d20cbe159de355644
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d38d20cbe159de355645
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d209f62610f2ef355681
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d209f62610f2ef355682
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d605794c76847935566b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d605794c76847935566c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d66beffb85a393355667
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d66beffb85a393355668
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6e2c15a56a3db355656
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6e2c15a56a3db355657
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-a64-pine64-plus       | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8d8876ec0712f355653
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8d8876ec0712f355654
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3d8e8de3af69f3556ae
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3d8e8de3af69f3556af
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5ca151282314b35565b
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5ca151282314b35565c
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6f63093f76495355653
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6f63093f76495355654
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-broonie     | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8d6ce0dcafd10355670
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8d6ce0dcafd10355671
>>         failing since 4 days (last pass: next-20220913, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5a19fe4b9c586355655
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5a19fe4b9c586355656
>>         failing since 1 day (last pass: next-20220831, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconfig+CON...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d659192131534435565c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64be/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d659192131534435565d
>>         failing since 1 day (last pass: next-20220831, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-orangepi-3         | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6aa3726f57e7435565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-3.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6aa3726f57e7435565b
>>         failing since 1 day (last pass: next-20220831, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d43c741e7da256355664
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d43c741e7da256355665
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1f8f62610f2ef355645
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1f8f62610f2ef355646
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d630e60bcc22c2355657
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d630e60bcc22c2355658
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d72160a71ed090355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d72160a71ed090355643
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-orangepi-one-plus  | arm64 | lab-clabbe      | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d941c50c1223ab355650
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d941c50c1223ab355651
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-baylibre    | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3bc3c54500045355652
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-baylibre/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3bc3c54500045355653
>>         failing since 1 day (last pass: next-20220908, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-clabbe      | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d39c1629903c5a355647
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-clabbe/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d39c1629903c5a355648
>>         failing since 1 day (last pass: next-20220908, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-collabora   | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d3e069db37b06135564e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-collabora/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d3e069db37b06135564f
>>         failing since 1 day (last pass: next-20220908, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d58b61c7e3f6b0355644
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d58b61c7e3f6b0355645
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6955d6b7da83b355660
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6955d6b7da83b355661
>>         new failure (last pass: next-20220719)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-baylibre    | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d851e89acf867f35564e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d851e89acf867f35564f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d1d1563ed244d4355645
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d1d1563ed244d4355646
>>         new failure (last pass: next-20220912)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d59e61c7e3f6b0355650
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d59e61c7e3f6b0355651
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6a53726f57e7435564e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6a53726f57e7435564f
>>         new failure (last pass: next-20220719)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-clabbe      | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d82302d2016cc83556ac
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d82302d2016cc83556ad
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d2132871a784ae355654
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d2132871a784ae355655
>>         new failure (last pass: next-20220912)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5ab6c08db985835564f
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5ab6c08db9858355650
>>         new failure (last pass: next-20220726)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6ac3726f57e74355669
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6ac3726f57e7435566a
>>         new failure (last pass: next-20220719)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun50i-h6-pine-h64           | arm64 | lab-collabora   | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d8284f5cc70745355644
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d8284f5cc70745355645
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun5i-a13-olinuxino-micro    | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc62f514ce013235565e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc62f514ce013235565f
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun5i-a13-olinuxino-micro    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329de2e9b2bff0085355656
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329de2e9b2bff0085355657
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun5i-a13-olinuxino-micro    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e0873e3578b43c35567a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e0873e3578b43c35567b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d487ef7f017cfe355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d487ef7f017cfe355643
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d603794c768479355668
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d603794c768479355669
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun7i-a20-cubieboard2        | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d71a676c13be90355678
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d71a676c13be90355679
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5561ed7efc2893556a0
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5561ed7efc2893556a1
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d98edd1a8c36c0355671
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d98edd1a8c36c0355672
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun7i-a20-cubieboard2        | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d9dd69ee5c93e7355653
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d9dd69ee5c93e7355654
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329ed58dcc93f4b8e3556d0
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329ed58dcc93f4b8e3556d1
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329f79609dd6b84ec355649
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329f79609dd6b84ec35564a
>>         failing since 3 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun7i-a20-olinuxino-lime2    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329fb7efa800b6ad5355666
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329fb7efa800b6ad5355667
>>         failing since 3 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329db32dfebbde580355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329db32dfebbde580355643
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dbfb22834c264c355643
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dbfb22834c264c355644
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-a33-olinuxino          | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc9a9d2fe577c0355697
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc9a9d2fe577c0355698
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d4593e871274f435565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d4593e871274f435565b
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5ef68fccf60fd355654
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5ef68fccf60fd355655
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d70edbce85b4b1355650
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d70edbce85b4b1355651
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dea656f92b0716355650
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dea656f92b0716355651
>>         new failure (last pass: next-20220831)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329df46558f99c266355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329df46558f99c266355643
>>         new failure (last pass: next-20220831)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dfe64165109d29355684
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dfe64165109d29355685
>>         new failure (last pass: next-20220831)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329f3d5263c91dbbb355642
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329f3d5263c91dbbb355643
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329f53e41bd3d370c355645
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329f53e41bd3d370c355646
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329f6f697d2833f6735564d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329f6f697d2833f6735564e
>>         new failure (last pass: next-20220915)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d474dcd9b323ee35565a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d474dcd9b323ee35565b
>>         new failure (last pass: next-20220718)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5f408a8f622043556dd
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5f408a8f622043556de
>>         new failure (last pass: next-20220719)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6f73093f76495355659
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6f73093f7649535565a
>>         new failure (last pass: next-20220719)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d446741e7da25635566e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d446741e7da25635566f
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d5f2405ed7991e35565c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d5f2405ed7991e35565d
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre    | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d7110e3738e662355684
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d7110e3738e662355685
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329db46e7f19a9bec355652
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329db46e7f19a9bec355653
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dbfa74c8b6faa935566e
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dbfa74c8b6faa935566f
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc4a1b72dce085355664
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc4a1b72dce085355665
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc5ec1db876f6a35565c
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc5ec1db876f6a35565d
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e0aac1a62e4075355648
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e0aac1a62e4075355649
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e10ed64ab19ccd355672
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e10ed64ab19ccd355673
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | gcc-10   | multi_v7_defc...BIG_ENDIAN=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329ec6438b9a2986e355653
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=y/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armeb/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329ec6438b9a2986e355654
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v7_defconfig           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329dc9ee99e3eef7d35564d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329dc9ee99e3eef7d35564e
>>         failing since 1 day (last pass: next-20220915, first fail: next-20220919)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...G_ARM_LPAE=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329de1ae9d38a4635355668
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329de1ae9d38a4635355669
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...CONFIG_SMP=n | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e6b3c137f2261f35564a
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e6b3c137f2261f35564b
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v7_defc...MB2_KERNEL=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329e7df790fec9b81355649
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329e7df790fec9b8135564a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_defconfig              | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329da81b7fb058e8b355683
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: tegra_defconfig
>>   Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/armel/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329da81b7fb058e8b355684
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> zynqmp-zcu102                | arm64 | lab-cip         | clang-16 | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d4bfcf813def9235564d
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    clang-16 (Debian clang version 16.0.0-++20220919071801+818b1ab84e7b-1~exp1~20220919071900.393)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-cip/baseline-zynqmp-zcu102.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-16/lab-cip/baseline-zynqmp-zcu102.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d4bfcf813def9235564e
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconfig+CON..._64K_PAGES=y | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d307775678a126355644
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+CONFIG_ARM64_64K_PAGES=y
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d307775678a126355645
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconfig+arm64-chromebook   | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d63b0e671090a0355667
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+arm64-chromebook
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d63b0e671090a0355668
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconfig                    | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d6db999785eeed355759
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d6db999785eeed35575a
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconfig+ima                | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d858e89acf867f355661
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+ima
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d858e89acf867f355662
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>>
>>
>> platform                     | arch  | lab             | compiler | defconfig                    | regressions
>> -----------------------------+-------+-----------------+----------+------------------------------+------------
>> zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconfig+videodec           | 1
>>
>>   Details:     https://kernelci.org/test/plan/id/6329d983dd1a8c36c0355668
>>
>>   Results:     0 PASS, 1 FAIL, 0 SKIP
>>   Full config: defconfig+videodec
>>   Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
>>   Plain log:   https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
>>   HTML log:    https://storage.kernelci.org//next/master/next-20220920/arm64/defconfig+videodec/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroot-baseline/20220919.0/arm64/rootfs.cpio.gz
>>
>>
>>   * baseline.login: https://kernelci.org/test/case/id/6329d983dd1a8c36c0355669
>>         failing since 4 days (last pass: next-20220915, first fail: next-20220916)
>>
>> _______________________________________________
>> Kernel-build-reports mailing list -- kernel-build-reports@lists.linaro.org
>> To unsubscribe send an email to kernel-build-reports-leave@lists.linaro.org
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#31644): https://groups.io/g/kernelci-results/message/31644
> Mute This Topic: https://groups.io/mt/93811057/924702
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [guillaume.tucker@collabora.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

