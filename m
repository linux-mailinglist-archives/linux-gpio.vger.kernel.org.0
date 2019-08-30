Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99DA9A3D31
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2019 19:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbfH3Rsg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Aug 2019 13:48:36 -0400
Received: from mga12.intel.com ([192.55.52.136]:45235 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbfH3Rsg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Aug 2019 13:48:36 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 10:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="gz'50?scan'50,208,50";a="382086231"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2019 10:48:32 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1i3l0i-000Hof-Ew; Sat, 31 Aug 2019 01:48:32 +0800
Date:   Sat, 31 Aug 2019 01:47:27 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org
Subject: [gpio:devel-gpio-driver-isolation 51/59]
 drivers/net//phy/spi_ks8995.c:467:2: note: in expansion of macro 'if'
Message-ID: <201908310136.aVjqFAIM%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="c5bbscuw72clrk7l"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--c5bbscuw72clrk7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-gpio.git devel-gpio-driver-isolation
head:   913bead035f39e059ce462d3bbd137d2a223bb0c
commit: 2e7bfc286b22879e076690e121e967a89cf48ae6 [51/59] gpio: Drop driver header from legacy header include
config: x86_64-randconfig-c001-201934 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-11) 7.4.0
reproduce:
        git checkout 2e7bfc286b22879e076690e121e967a89cf48ae6
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/export.h:45:0,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from drivers/net//phy/spi_ks8995.c:14:
   drivers/net//phy/spi_ks8995.c: In function 'ks8995_probe':
   drivers/net//phy/spi_ks8995.c:467:19: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]
     if (ks->pdata && gpio_is_valid(ks->pdata->reset_gpio)) {
                      ^
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
>> drivers/net//phy/spi_ks8995.c:467:2: note: in expansion of macro 'if'
     if (ks->pdata && gpio_is_valid(ks->pdata->reset_gpio)) {
     ^~
   drivers/net//phy/spi_ks8995.c:471:5: error: 'GPIOF_ACTIVE_LOW' undeclared (first use in this function); did you mean 'OF_GPIO_ACTIVE_LOW'?
        GPIOF_ACTIVE_LOW : 0);
        ^~~~~~~~~~~~~~~~
        OF_GPIO_ACTIVE_LOW
   drivers/net//phy/spi_ks8995.c:471:5: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net//phy/spi_ks8995.c:473:9: error: implicit declaration of function 'devm_gpio_request_one'; did you mean 'devm_gpiod_get_optional'? [-Werror=implicit-function-declaration]
      err = devm_gpio_request_one(&spi->dev,
            ^~~~~~~~~~~~~~~~~~~~~
            devm_gpiod_get_optional
   cc1: some warnings being treated as errors

vim +/if +467 drivers/net//phy/spi_ks8995.c

a8e510f682fe6d Frederic LAMBERT 2011-12-18  431  
a8e510f682fe6d Frederic LAMBERT 2011-12-18  432  /* ------------------------------------------------------------------------ */
633d1594974b33 Bill Pemberton   2012-12-03  433  static int ks8995_probe(struct spi_device *spi)
a8e510f682fe6d Frederic LAMBERT 2011-12-18  434  {
a8e510f682fe6d Frederic LAMBERT 2011-12-18  435  	struct ks8995_switch *ks;
a8e510f682fe6d Frederic LAMBERT 2011-12-18  436  	int err;
aa54c8da9a8e48 Helmut Buchsbaum 2016-02-09  437  	int variant = spi_get_device_id(spi)->driver_data;
a8e510f682fe6d Frederic LAMBERT 2011-12-18  438  
aa54c8da9a8e48 Helmut Buchsbaum 2016-02-09  439  	if (variant >= max_variant) {
aa54c8da9a8e48 Helmut Buchsbaum 2016-02-09  440  		dev_err(&spi->dev, "bad chip variant %d\n", variant);
aa54c8da9a8e48 Helmut Buchsbaum 2016-02-09  441  		return -ENODEV;
aa54c8da9a8e48 Helmut Buchsbaum 2016-02-09  442  	}
aa54c8da9a8e48 Helmut Buchsbaum 2016-02-09  443  
b32a8b6410b9e7 Himangi Saraogi  2014-08-03  444  	ks = devm_kzalloc(&spi->dev, sizeof(*ks), GFP_KERNEL);
e68ed8f0d8f5b0 Joe Perches      2013-02-03  445  	if (!ks)
a8e510f682fe6d Frederic LAMBERT 2011-12-18  446  		return -ENOMEM;
a8e510f682fe6d Frederic LAMBERT 2011-12-18  447  
a8e510f682fe6d Frederic LAMBERT 2011-12-18  448  	mutex_init(&ks->lock);
a1459c1c9ebcd7 Mark Brown       2016-04-20  449  	ks->spi = spi;
aa54c8da9a8e48 Helmut Buchsbaum 2016-02-09  450  	ks->chip = &ks8995_chip[variant];
aa54c8da9a8e48 Helmut Buchsbaum 2016-02-09  451  
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  452  	if (ks->spi->dev.of_node) {
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  453  		ks->pdata = devm_kzalloc(&spi->dev, sizeof(*ks->pdata),
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  454  					 GFP_KERNEL);
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  455  		if (!ks->pdata)
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  456  			return -ENOMEM;
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  457  
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  458  		ks->pdata->reset_gpio = -1;
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  459  
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  460  		ks8995_parse_dt(ks);
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  461  	}
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  462  
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  463  	if (!ks->pdata)
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  464  		ks->pdata = spi->dev.platform_data;
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  465  
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  466  	/* de-assert switch reset */
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09 @467  	if (ks->pdata && gpio_is_valid(ks->pdata->reset_gpio)) {
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  468  		unsigned long flags;
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  469  
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  470  		flags = (ks->pdata->reset_gpio_flags == OF_GPIO_ACTIVE_LOW ?
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  471  			 GPIOF_ACTIVE_LOW : 0);
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  472  
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  473  		err = devm_gpio_request_one(&spi->dev,
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  474  					    ks->pdata->reset_gpio,
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  475  					    flags, "switch-reset");
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  476  		if (err) {
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  477  			dev_err(&spi->dev,
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  478  				"failed to get reset-gpios: %d\n", err);
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  479  			return -EIO;
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  480  		}
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  481  
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  482  		gpiod_set_value(gpio_to_desc(ks->pdata->reset_gpio), 0);
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  483  	}
cd6f288cbaab65 Helmut Buchsbaum 2016-02-09  484  
5d5f18460f451d Jingoo Han       2013-04-05  485  	spi_set_drvdata(spi, ks);
a8e510f682fe6d Frederic LAMBERT 2011-12-18  486  
a8e510f682fe6d Frederic LAMBERT 2011-12-18  487  	spi->mode = SPI_MODE_0;
a8e510f682fe6d Frederic LAMBERT 2011-12-18  488  	spi->bits_per_word = 8;
a8e510f682fe6d Frederic LAMBERT 2011-12-18  489  	err = spi_setup(spi);
a8e510f682fe6d Frederic LAMBERT 2011-12-18  490  	if (err) {
a8e510f682fe6d Frederic LAMBERT 2011-12-18  491  		dev_err(&spi->dev, "spi_setup failed, err=%d\n", err);
b32a8b6410b9e7 Himangi Saraogi  2014-08-03  492  		return err;
a8e510f682fe6d Frederic LAMBERT 2011-12-18  493  	}
a8e510f682fe6d Frederic LAMBERT 2011-12-18  494  
484e36ff18341c Helmut Buchsbaum 2016-02-09  495  	err = ks8995_get_revision(ks);
484e36ff18341c Helmut Buchsbaum 2016-02-09  496  	if (err)
b32a8b6410b9e7 Himangi Saraogi  2014-08-03  497  		return err;
a8e510f682fe6d Frederic LAMBERT 2011-12-18  498  
240a12d58e3935 Philipp Zabel    2014-04-03  499  	memcpy(&ks->regs_attr, &ks8995_registers_attr, sizeof(ks->regs_attr));
239870f2a0ebf7 Blomme, Maarten  2017-03-02  500  	ks->regs_attr.size = ks->chip->regs_size;
240a12d58e3935 Philipp Zabel    2014-04-03  501  
a8e510f682fe6d Frederic LAMBERT 2011-12-18  502  	err = ks8995_reset(ks);
a8e510f682fe6d Frederic LAMBERT 2011-12-18  503  	if (err)
b32a8b6410b9e7 Himangi Saraogi  2014-08-03  504  		return err;
a8e510f682fe6d Frederic LAMBERT 2011-12-18  505  
4342696df764ec Blomme, Maarten  2017-03-02  506  	sysfs_attr_init(&ks->regs_attr.attr);
240a12d58e3935 Philipp Zabel    2014-04-03  507  	err = sysfs_create_bin_file(&spi->dev.kobj, &ks->regs_attr);
a8e510f682fe6d Frederic LAMBERT 2011-12-18  508  	if (err) {
a8e510f682fe6d Frederic LAMBERT 2011-12-18  509  		dev_err(&spi->dev, "unable to create sysfs file, err=%d\n",
a8e510f682fe6d Frederic LAMBERT 2011-12-18  510  				    err);
b32a8b6410b9e7 Himangi Saraogi  2014-08-03  511  		return err;
a8e510f682fe6d Frederic LAMBERT 2011-12-18  512  	}
a8e510f682fe6d Frederic LAMBERT 2011-12-18  513  
484e36ff18341c Helmut Buchsbaum 2016-02-09  514  	dev_info(&spi->dev, "%s device found, Chip ID:%x, Revision:%x\n",
484e36ff18341c Helmut Buchsbaum 2016-02-09  515  		 ks->chip->name, ks->chip->chip_id, ks->revision_id);
a8e510f682fe6d Frederic LAMBERT 2011-12-18  516  
a8e510f682fe6d Frederic LAMBERT 2011-12-18  517  	return 0;
a8e510f682fe6d Frederic LAMBERT 2011-12-18  518  }
a8e510f682fe6d Frederic LAMBERT 2011-12-18  519  

:::::: The code at line 467 was first introduced by commit
:::::: cd6f288cbaab656cebd524c5ef2388c11378c827 net: phy: spi_ks8995: add support for resetting switch using GPIO

:::::: TO: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--c5bbscuw72clrk7l
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICM9YaV0AAy5jb25maWcAlFzdc9u2sn/vX6FJX9o5k9Z2XDfn3PEDSIISKpJgAFCW/MJx
HSX11LFzZfs0+e/vLsAPAFwquZ1Oa2EX34vd3y4W/PGHHxfs5fnx083z3e3N/f3Xxcf9w/5w
87x/v/hwd7//n0UmF5U0C54J8wswF3cPL19+/fL2or04X/z2y5tfTl4fbk8X6/3hYX+/SB8f
Ptx9fIH6d48PP/z4A/z7IxR++gxNHf6z+Hh7+/r3xU/Z/s+7m4fF77+cQ+3T05/dX8CbyioX
yzZNW6HbZZpefu2L4Ee74UoLWV3+fnJ+cjLwFqxaDqQTr4mUVW0hqvXYCBSumG6ZLtulNHJC
uGKqaku2S3jbVKISRrBCXPMsYMyEZknBv4dZVtqoJjVS6bFUqHftlVTesJJGFJkRJW/51ti2
tVRmpJuV4ixrRZVL+E9rmMbKdmmXdrPuF0/755fP4wLicFpebVqmlrAGpTCXb85wJ/qBlbWA
bgzXZnH3tHh4fMYW+tor6I0rS4V+hlprripe+FSibiFTVvS78eoVVdyyxl97O/tWs8J4/Cu2
4X2Hy2tRj+w+JQHKGU0qrktGU7bXczXkHOGcWAYcFTH/aGRxLRyWXyumb6+PUWGIx8nnxIgy
nrOmMO1KalOxkl+++unh8WH/86uxvr5i1Fz0Tm9E7R3CrgD/n5rCn14ttdi25buGN5xoKVVS
67bkpVS7lhnD0pVfu9G8EAk5NdaA3qFkFDeIqXTlOHBErCj6YwFnbPH08ufT16fn/afxWCx5
xZVI7RGslUy4p188kl7JK5rC85ynRmDXeQ6HX6+nfDWvMlHZc043UoqlYgbPB0lOV764Y0km
SyaqsEyLkmJqV4IrXJbdTN/MKNgoWCo4kKCXaC7FNVcbO8a2lBkPe8qlSnnWaSWYqScfNVOa
dzMfttBvOeNJs8x1uNX7h/eLxw/Rpo36XaZrLRvoE1SuSVeZ9Hq0EuCzZMywI2RUjJ6C9igb
0N5QmbcF06ZNd2lBSIdV0ptR2CKybY9veGX0UWKbKMmylGlznK2EDWXZHw3JV0rdNjUOuZd6
c/dpf3iiBN+IdN3KioNke02trkFYlZCZSP39qiRSRFZw8kQ6ct4UBXEsLdHrQSxXKE124awR
HHZ7MlhPmSjOy9pAYxWlTHryRhZNZZjaBYqoI5Kj64mphIr9qqV186u5efp78QwjWtzA6J6e
b56fFje3t48vD893Dx+jdYQKLUttG076h843QpmIjPtFLiOeBitOIy8x4kRnqKlSDuoTGL3N
iynt5o0/FAQJ2jCjqWXQYmwHfgwmooM2mb9P37E8w3GCmQsti1652eVVabPQhETCVrRA88cM
PwEBgUhSCl87Zr96VIQzboMibBAWoSgQ8ZS+wkVKxUGLab5Mk0J0SKebczjmEKgkojrzTKJY
uz+mJXZ3/GIHnDzNUEhsNAd7I3JzeXbil+Nalmzr0U/PRjEWlVkDZMp51Mbpm8A+NoA/HZ5M
VzBXq1r6fdG3f+3fvwAqX3zY3zy/HPZP4+Y0AKrLugeaYWHSgHoC3eTO0G/johENBmpYN3UN
sFa3VVOyNmGA29PAeliuK1YZIBo74KYqGQyjSNq8aPQqYh0ahNU4PXvrqfWlkk2tfdEC6JEu
yXOYFOuuAoVbLMEtn99czoRqPRpRFTRBWDlsshZZMMCuWGUhPgypOUj9NVdEvVWz5LBO5AxB
lDQnFUFXOeMbkfLJEKFeqHL6oXOVTwqTelpmjb2HDmS6HkiBmUZYCtgBdFmAClFWNK08AYRW
1IxgpgoogUUQ2VwzFTdzJNi0dF1LEC20X4CUaGPoDhY6NBMRGnl2OtewGGB9AHPRwsIL5iE2
lEnYFItWlCc79jcroTUHWjyHSWWRnwQFkXsEJaFXBAW+M2TpMvoduD7g/coajBa4uYgCrSRI
VcJBJkF/xK3hj8CXcD5EoLBEdnoR84BNSHltwSjM3hdUW6dOdb2GsYDZwcF4q+iLpLMrgXhh
X8SwS7CEAuXIZ9ZwvBDutx32o70l3JgBG/r7j7OYr5mvWJVZuBn5Uw41kUAGLYBnxJ1FqErP
sAdnjxc5aGzlrd102UaVyADEzwC8vDF8O7Zif8IR83qqpQ+NtVhWrMg9IbaTygN1auFuTh0M
vQLN7bMyIQk2IdtGRWCMZRsB8+iWnVpFaDphSgnuuUFr5N2VelrSBpB/LE0A8cAq4GEAjUlw
2OXEE46OYyCe7cSTQLmzWMxfMWvtMD41DhhqVmm/oyOA0vwdqYKgHs8yUvW4MwS9trHjYgth
QO2mtP5iIJ/p6UkQbLCYogsC1vvDh8fDp5uH2/2C/3f/AGiRAUZIES8C5h9xBtmttRp05x3S
+M5uPFxeul4caImOVBAVYwA+1JpW4wWj7asumoQS3UImgRqA+rCDasl7vE3Ke5PnANhqBmyE
lw6YMhdFAJusTrSWKvCvwshgz3xxnvgO8NaGcYPfvrVx0UtUvBlPZeafE9mYujGtVf/m8tX+
/sPF+esvby9eX5y/CuQW5toh5Fc3h9u/MHL8662NEj91UeT2/f6DK/HDhWswmD3E89SJYena
znhKK8smOjMlwkdVIWh33vTl2dtjDGyLYVKSoReOvqGZdgI2aO70IvbbA7XsFQ4aorV7GTgK
g8/PCpEoDFJkIWAYNAS6DdjQlqIxACsYEeeRKR44QLSg47Zegpj5cQJUEQAhHfZzDq7iPn5D
T6onWV0DTSkMo6waP/4e8FkRJ9nceETCVeViUGANtUiKeMi60RhsmyNbV8IuHSt6gDyyXEtY
B0DbbzyEZEOJtvKcq9EpJxh6r5WCk9Tqsp6r2tiIo7erOVh4zlSxSzHMxj3kku0AEWMocbXT
AjY9ijTWS+fVFaDUCn157gEu3EXNcIfxoOA28tQpEKug68Pj7f7p6fGweP762Xnznvc3qKp+
bSgF5U8QJ51zZhrFHYb39R0St2esFinRDBLL2oYLg1ChLLJc6BWpZxU3gC1ERSNxbNFJP6At
RUEX5OBbAxKDUkjgHmTYwARn2z86PGTAg1u0Ra1pC4MsrBw77zwv2sWROm/LRMxMZBCrLqgO
HmnRhGjA+SayBJHOwWsYFAsFAnZwKgEuAUpfNtwPN8IWMQxrBca/K3OngRz9wKJrUdkoK70g
YXCsR05gr/thjC1u6GVHZncq47ByPJRvR9sG1j5SMjTyByzvSiIesQOjrypSVR0hl+u3dHmt
U5qA8O6MJgEqKIkJDIbCB6K9YKoKTHhnBVy46MJnKU7naUZHqi4t6226WkbYAYPSm7AEbKUo
m9IezRyUWrG7vDj3GezegX9U6hDmYGATnUZe8CAGAe2A7LuTNi2G0zUtXO2WNvbnR0QsIQVM
yBrqQPQc1ysmt/7dy6rmTpK80WbW7RqVGAMJEhLgCA0zWQEcuyMcABwiLdTbT2s5datYBbYz
4UtENDQRtNzlb6cTYoc8vT3oKF6J0xu69GGXLSrTaQm6njLccnvX26Lij2RQ9oWBQlRcSfSf
MESQKLnmVZtIaTBATjltVqhSHrcCRRgKLfiSpbv5arHc9MWB3PSFeMOlV6DzpyRR/RGIpT0k
Kw5guGg3ocn1vJRPjw93z4+H4ErB84E689FUkac+4VCsLo7RU4z8h/EEj8daIHkVGoLBb5gZ
rz/R/gIMoF5TRDeZ4m2gNwHFwFEGvTO3JVrFOwnSKLJZ8/mbBT0zraU1Q+BjhDYi9ZCW70DD
yUjVrvb2Dtfjewig4C0+T3bDMfJvzRoSLzkMaIGOa4oROHYgj+0GdKsDe0uPF7JBfMl5II5o
MSYVICnwZBQ9BMDbzoZfnnx5v795f+L9Ey52jWOaHqlwuzBQCg6PxCsBpRobqJvZH3evjJcW
V6hvRikxStEmFacGCi0jrZ3FQeB5TU0dHKJSkOVgt8jiYfkQMKPPsea7AM7yXJBD1DxFp4+k
ra7b05MTCm9dt2e/nfjNQ8mbkDVqhW7mEpoJVfJK4SWl3/SabzmFwW05+nyUK+iIdaOWGIDw
XE1H2ADMyHcY3QvsqmIaPP6GNF6DMwMnFPDkyZfTTuQGeG+jHeH5cHuPEWSMooU7Z71JW8sP
WvW9gKu8rKCXs0iuxxbdnlPLKk1dNMsORY1hUbBKiBBLn4HaFgdHfSYPk7gAwSbTntV0RyzW
q4ECj1m2siroQxlzxrfo426VmQ0GwLwKGofIDDe5yMyR4LUNDhSgF2u8tAuG3BfSduaIKzqR
RpZl1umOdbpTp/3p7Vb8WzwK/trEMt9x6boAd6lGC2k6H4DgwmCCDV/4qTzO2j/+sz8swHre
fNx/2j8823mxtBaLx8+YEhm42V38gjorgV9al1NPaySlRXDar9454465SiIVGPWcDzeiu7Ac
TUpgdHoHE0fv0Sa/eoGzJ1eDbpfrJg6CwDqtTJezhVXqLI0aAQEzYGzc0C180V6Ez/OxauEW
Y0k6sq6tOlVtpEjcSGsxbQ19jVxPEZHPo/imBZlRSmTcDzeFLYFeJPKbfA4WTzthBszxLi5t
jAk9Flu8gd6p2w9LzNm0QgYSPMdvHTLFQVq0jrofva8BSNJkkU2WOK3rFE5+MldnMkZRl1SM
w9JmFHE0CrZcKm7N1Fw7HTKPh9po8KLbTIN+s1bw1aup4rHV7aFvajjrWTzfmEZI6kywAOeQ
CrwmoE6mG6EE/xRU9HTV+pWZtWEBl5Cx4+XOSUJHTFxdToNwf+lKblbyCJviWYOpgiumsium
eDtrtCw7/DWf6mmPT8095ROWd5efYYtIIPvLapNTTtCgVgVeXoNYRWA2Wgb7N3ncHXyOIwU6
F5dj2tkiP+z/92X/cPt18XR7cx+4hf3xDKMZ9sAu5QZzaDE2YmbIQ7pTEPKwZDzRc2kijqPP
BsOGvnHDT1bBVdVsw8nufU687LRpH98/HlllHEZDyxxZA2hdMuvm/9GPxdKNETQwCtb6O5co
XhqKPizIDL2fPbmyxyZL8Q5T9CXyQyyRi/eHu/8Gl7aj01RPwgxW6lMbf8R+5oPgnQU6ygTg
iGeAClycTomKsn22x3MXsAUY08/l6a+bw/69B7rIdp2d8lMdiSM5rI14f78PD6iIsjb6Mru+
BYBWElEEXCWvmtkmDI/y/b2B2tF41wV2R6ZJuz3a/iYutdNMXp76gsVPYJ0W++fbX372glVg
sDKhgtAXlpWl+zGWuhIM+Z6eBF4BsqdVcnYCc3zXiJnLdqEZoKCZ5C+gZSXDYCJl+AC7Vx78
sDu+03mw0zPzdGtw93Bz+Lrgn17ubyLpEezNGRX0sldd/kVi5+VNiyYsGPVsLs6duwrC4Add
u9cWQ81x+JMh2pHnd4dP/4DcL7LhzI7hi4zyM3KhSmuYAUcEgZSsFCILfrr8pqgIn1iVLF2h
Gwl+JgZJYMuLImFhCELoVAPUS3JEWjPaO79q07xLoyIZllIuCz6MmXJnoPv+RrXXBGb/8XCz
+NAvjVNnltInotMMPXmyqAH8WG+8a1u8OmrwEVgvHv4lFTmlDT7K6V7H4LMRfLE2CbcFD70w
h+LueX+LjvLr9/vPMEo8zhNF50IxYSDZhW7Csh4iBuF+6dJM+LSky6OxOXJ14WeC2eU4UhHg
2YCGxnVxd+Lk2vzRlKChWUJGe21vo4fbVPb8YCpmil5B5H7ivR1mbxtRtQk+doqGLWBJMIOD
SHtYx7f2rhTvoimCrOnyrhmw4G1OJTHmTeXCjuBjomNlrxcCHWPZggS/8QmUbXEFjndERC2J
PoRYNrIh8kk0rLA1Nu4tDxEGBPVkbKDP5ZtOGQCDdk7IDNGZi7acLLobuXva6BKN2quVACsm
dBwAx0wOPWRFGJuHaWtETQJeB5etylz2QycLaCdiPu0D63AD8MXkbEUXa/FLVldtAlNwqcIR
rRRbkMiRrO0AIyabsQzi1KgKVCgsdpCOGGfnERKAzhWiH5tw7dI9ohTtsRGi/z7RTnWLhtFb
aqfG43icSmQ6ujVPm85Zxiz2ibA44XZvGrrL5XjtXam7XpyhZbKZyQPqzC3aU/dIrX+jSvDK
IvP4qel2Qf8uYYrkwMUsYOcj4iQvp9fXXe5OQLaxW19fhuRZX9nORBgwy92m2vyPeOdRM/Ct
sdpjHaQUWvLMY6ZYdU6fMcWnQKKU+fergeKq8PYLdXgfVP1evrZuyDaRjlmjcQzSbq0lYnhX
w7Ehu9Iyt0rL7CbzyPrrOp7CMfUEA0gNxj7RzmCmNR4BYp34Vhi0APb9pmGT6DIKgK3eX1FQ
4wtSFiMG2wGpy8NaYxYk0a6XwjjXiM9CNNWRLTte20wFr971mt8UMdVJbPccc2oCYW2FC9UP
qaAjR+c2hJobj7MWyy7a/mYCwTs6iwyuTZW1sk3g+ilpnD7KXry/VNloJsG5BevXveJWVx6q
OkKKqzshJKtTpKG6wgRd9x7SS7VzZXOvAMbJ1rAf4BR1l3ewgBT2AoAQAKzxigifBHmp2XqK
e1O5ef3nzRM483+7tO/Ph8cPd2GwDJm6NSImaKk9DI3eZsQ0KqcKWVyec3ve/u77YccGN7jH
gK7xXTYA/TS9fPXxX/8KP3KAH7ZwPD5ACwq7hUgXn+9fPt6Fd0gjJ75ZtgJaoBqgYsIeL14v
VviJCKPgMFIdWy00oCyqv5FhLgbmLZQ3+DhD/RsuTT80hW4HGCxfndinFRpfCFyeRsrYH3Qn
//bhOsgcox3QjqupYo6R3oEGqnGt0uH7FsXsfarlFPSVQEfGLVRckw9WOjtjX7/GF21JeF+J
b8is1634uzCls39dluglWRjc3oxP0QxfKmGCx9Y9EfOFqRWzbyu7W2aLulTY8FViJgVt+S7u
3SV3xh1rTG6tWTFRGfXN4fkOZWdhvn72n7XCEIxwID/boKwGgVQGjnE18lChJbEd6X5VTNUl
K46Nl2BgjjdumBJ08yVLj1YtdSY1XRVfiWdCryd+tJehVcG0dJMc6wEfdSuhXbSV6qeBRmwg
6XhnRVYenYlehkvQt17Yr1YQFN1U9IDWDNTRNzYFw0VHR7PTm4u3VLeeUHtd97HWSP6CAzqJ
A6Iol+8wLDopQwTuJ1disc0McN84keOTa0/IoZ6QLhUoA4CFw/SA6khc7xL/OPbFSf7On0vY
yXiQos9s6OrU261KVO6VSQ1WoqmIPIoxucBIdOlV6X1wxWp5VxmOqryq/HGqK83LOaJd4Bna
AEbsN2qyMTF9ZJmnxJXVFV11Uj6CtP69XpvwHP+HLnf4bRWP12XuXClW1/4cxvffVgL4l/3t
y/PNn/d7+6muhc3bfPZkIRFVXhr0KSYQliLBjzA4aMeLAYHhbgzdk8l3DLq2dKpEHYCFjlAK
TeWfYetdtGGQt7kp2fmW+0+Ph6+LcrzFmIQ96VTJnjjkWQJSaRhFiX2+Pi2Q6zA0PyZ0bjGf
iFOkjQuqjzmfoxsf88xBbHzwaYXapu5PY2g5fqtm6aOAbsT+ZzhCyiRJKizvxjZL7gVBVp1m
GQ1JlGBFKVSXXWWcIsSs8/OomwSfVUUmzBU5wU1nVPVI9EY+/c5SaoOhbfR2C3MGMcVMtSZ+
IOkejkh0Kr2Gy4YI1a21/4KrWyYrAO4zPpm6PD/590Vw2r/jFU9IIe0YFR2ZS0V2oVSzqtsw
Dp4WHBARvv/wrRwLfgwfdPBSCNmRlCekwqiYvvy9L7qupQwcsOukodH49ZscHHOapN2b4CMP
YOwtUB/XD7aFK8WHgLONI3XfhBovq7L+AW4fGZtbTFTWtX2NGcabViWoGIGR/KkJ0e6jSFCh
zQu2pGxFHeceu6fl7eR7PqNXhl/g4FW6KpkiM7780dr4FSt8tTuvWfsWKj69u4Qy/L4iiKjW
YXKmXifuqV3vLVn9Xe2f/3k8/I1ZBRPFDad37XfhfgOcZJ6qQpQZ/gKjE6RK2jKsRB8U8jMA
29z/agT+amWeoxMYlbJiKaOiJvBpbJFNsM+DsJQtB4jd4vvFdBcRnJ4K8yhsheElw8ygMTot
/4+zN2uSG9cZRN/nV2Schy/OiZi+nVLuc6MflJSUSZc2S8ql/KKotqu7K07Z5akqz9fn31+A
1EJSgNJzO8JtJwDuFAmAWNr7c1gmtFynbSrCQsVgoWPBSGuFZaHf+NoYZcO3UfSyU6Pcdigl
NBBplx6RBFVlviMDpsgK93cTHkXhtIJgZXBNmwBogjIoSTepCBX3pv2/hhyQm4nS09VFNPUp
s3RHPT1VBRG8DaerHbITaKrH2IOWaQWXv+cOWoNpnz/gIKH2/E5G1PLp7p1r6e6GOKedzFrc
MHpuUzSB4Q2tAFFVjCHGN2MYpaheuf4RJtadeQW0v3pNJwoKfAp7sN1qGVxG54DbBGwGuAdy
S6WB7cA/D/02JyroacRpbz4DdJd+h//tH59//P70+R927Wm4cjRA/QY4m9EX4Ff7iSH/GVMY
FRLW3kOA0kF38OBoQlKRhROw1stqTdoa15Gl7w8bs61UFm6fpfn2oYuqw4pa6fUYilXobWxC
KlmPIc3aCo6E0CwEWUNxy/V9ETlIsq2DzW7pUbXmDa1NO3MEIaFaBh5fRYd1k1x0w8ySayK4
uYV12DhPrQDBoMH48oh3vH0uFXXRnrXx/bgIsLfqrQLuk7Sw3ueAwn3B7EGmjqzjxEsZAldk
lmrjO78+4uUOEtv74+soBrR55LR1Qy8YFedA03IXVNe0I3HbH4qg40zs+GVjvBLbpwiSnJqu
Hp1XxneZYYilLFNMowVV8fxGFrktAqoC9nFyJrDW7omGaKtpN4RZ84BsNwzVgEmGKtyKqV97
SDDIPnwP3TxuPPhG6CvIJVQ79FZP1YcxarBWb0t5EwrB1dCR2Ne6gahEXdAYuGZAco2YKQjQ
JjdgkHFdsJNzXPiLW8OVpWDLwxZRjpdceDtrH2S3p7Yo3AkYigcZN/xKcoXqeDyh48/aBDfH
KCno86ijOCQnYLPsbyELRr+pVUGw2yWE6Tm2Ye6oEDYaDwJBnHQsYltEGlRwvtg+I4DSdwoB
su35B3DLmZvL2mL4syOu0SHZMtdAmHAq6iNiMXXgUurw8U4xOLmYIh25AcKJcCtQs8b1PHAq
6C9uq4p8/wH4Imbn1w0Xi1zjcqW/drqERnfsTPRGuAYUROojUyCWe5caQGox2S4jn8RUpwU3
e1qc2wfmCU6r673bLAgOCj55x1z7balu7KvSwb7NPr98/f3p2+OX2dcXfAMwBHazaDNiSQYU
bqEWbdX8/vD65+M7V2EdlIeoppmaMdXQxATV8TYJan4cjx2KLDGZIpKA5hoGgtGNbdJkAbkJ
iWoyDEpZTDeVxTd7k8UsHzQQoYrCekYmiYazkB5bP/7uaORk01ERaP0nZ4VikcfViSKtRtv9
68P7578mdnmN+QbCsLSFC4JIxx6lB6Qp2JjDFG1yqhgufaABBtN6oyBpsmx/X9vGEQwdZ3nN
kY9uCZqO40Vp6o6Xnqy1YBUcLqnLHE7SRuf/ixUKK8F9h5ogEtmNcdCyN0GIl87PTLdmpX52
vMefXGxXDUCSqBhEkzSJX09XkkTZoT5OkzisxpjCFarHePacaAmUJsBxQifoshhFzZ+bQfva
JvD2wzVB0auRp7qEr1q3JMuB+K5uz7SpKhXb9LMbqr0wfq79MgqSdHLMcK1E2a1lQAnu5xrs
+anJ6tC/8Sfr65T1N6ss6Qclgra/oyZILBtUguC00GmIOs/BKVWNpYuuGD4VUOexmaYs/teE
BmgQXMIoLgOl9zIixwFcL8cYrjlaAt6KRg68bkKMDTeCKs5bQwkxinlFiM3KXLUNWwaRo+5q
0WIMRzGxFbrNCQaMLCZ1j0gCXaBoOsudiRVpl+z/rH9u0YbFWTOLs2YWZ00uzppcHLsOitSY
xjWxJAhmpmvNT2k/XVOzQe7gdcc9hpH49vj+E3MJhCrlQNwcymCPbqRtQIy2E7cqojavVoJS
xpettjZuor2rc2hxgMDXLOt1ykDVI/8WC5nZ8rCB2879hlJsGSRBmpuaaBNTFky1ZMI1C79m
SipOYbqwK5IZqPZynC5f1Vy3z0lA2x/agy6jggmOYdCFGRO9wRlJc2O0lKBmDoaWQc0ZzenV
c8RNkIO6LTS008KaU0opT+BwQz59qEO/14nhAVB/dMjLCyHDN/7Boa2qQTJ/IhiLSbcgjwe2
taEvbVT648Pnf1vOCV3lg/GMWadTyijUaqOH91/43YT7A+q9REbvAk3TPkPqx2L1soSPjpQ9
FkdeHQNv3DZByKToUvRO+8OCjrBtc+Z66xadl90ypO9DYNEpY6CgtlNH1BgsS9ISICLhOyXt
pgC1L/31dunWpqGwWHpD0ybPPsmSVqb4c9BnXvsrNX/0b1zuZyoPKeyRLM8LJnOYJsPDpz3G
x6556sOqrEDuNAAumwOe6t5HGrUvRToyfXAJJori4RdlIU1xqC6uLUeHYvsasZi0vqMRd9Wn
ySEAnkXslpsNjfwomH7AuuwW8wWNrD4Enjdf0ci6DGRi3spqjZ3VGWDN4WxuKAORWgjNnLi/
WxOEAZwklogDP2lzlaAOEkrTc/WNYSVBYfiaFMfceepYJ/mlCCiDTxlFEY5iZTDUA6zJkvYf
Ku+PRM1YYD0gGLSavaX8KgLhNqGPJp3QSx39H388/niEk/vX1kzeOvpb6kbs7fePFnys6YQi
PT4m7aY7tD7eHKAdjrmDKjXGxzG8dDTZCqhjpYyARPE6+pgQ0H08Boq9q3RUYBBYJ6egDnBA
E5NwIIcQVmMjCYTD33Y6ob5AST5GddP3kZ7W6m5PI8Qxv4vG4I/UJArbSL0Dxx85jAioumN6
ix3jiXEV0tX4aHBCxprs58oNUtwxBnYXBnYhZLyBhnI/QQQbcBIPd3CcK4N4ousdUTuE3/7x
x//+R2u78vzw9vb0x9NnV+xVr0+28gUB6HIoxRhcC5mF0XWMUOfncgyPL2PYyQoYpAFuur0W
Srwg6eaqM2cS2aHXRGeSnOiOfqIgpmD0uNFXQr8ktwRKI2Wlu0JMlLaBY0ew1mF6SMljoISj
g+7g6n3D7V3U68KY3rUEaVQHZK0YJ4FEiCCTIYlxXGG6OQg4LbH+iGVsnCahMA7iMENX7SrH
LOoGewiXQKD8GS0WsYd2/6TUwCaVabNnwEPLU22AZ4IEp665sFkV6ybgEjEV8IGhDCJ8MKL5
4RwYzDNwktZeM4C2WdC5NZQeQxwrVO2jR9HbCIq1VOYsdnVp4Z45CAEW2DLzVDA8WFhVcpOZ
6VKPlf2e0Oghh9HZBicLfJlF0XyEykRlmxaja3EepegK2egnXYpXKQtjOGWsUhVb+RdMfJsb
FJuzr1UDMTIpVzwq5smt7hs79eD+o8XxYb69D5LRnmAuvrqMgrT1U2ZmFY+4/tnJ9GmYvT++
tamirU++uKu5BNCKpS/zooFtIZ1oLr2OYFS9gzB9KQbRLi2DUM1f6w/9+d+P77Py4cvTCwYo
eH/5/PJsBREIgCmn/HfskMIY7K0MLjRhszcFPAQcLl0H4NcsfPw/T5/NyHQG5Zlo6HwVjNYM
sVUiSKkAcXrrWuQiSARGK0G76IxWASmyhq9ViM1mPqoXgRh0ZKoQkZkUcTKW+LedCFPF03N7
YWGLKLhDZ+EoZmKg4uyA9EgnDFDYPHbzlhvgRowfd7A/FQZbxLyKfzx8tpOFYeGjXHjelWkw
FYW/8q6m6ouosW/pVO3tloyqthhtAAjsqYzSigBWIQJ9d5wHRcvO3d05wFhYDok1mn0wbk0t
i4Za1Z1Ga2nMgDNSu6QOe6AThNFPFsRnZZxoZFDpGI7KsrAjQbcw/vlkoFBR6ZokJy23ezIn
7XN5vbO9QoDwTlB2bvgQVJ6sh4qLLKPECujXQRqLJbtEytTMvMIVyM7BrkCVGe+kJZL2kREf
UO73xh9Ch/j2+Pjlbfb+Mvv9EVYDbYe+oKvyrNUYeIY7fgtBXlZZbqis7ir/4nwYUmombFQ/
2/VX2W6GGEtlfCfNK07/RoM0S7puwTIrGMvrluBQsLL1zmGvd8UQjsC6wnbFhGJdBJKSP0VU
HO0g8R0ENYF1fT92NO3w6IRvssLkI6xjMQ1bUh5kHdACJuIzQYWSRcxRSLey6hgmYrQ3sseH
11n89PiMGWi/fv3xrRUpZ/+EMv+afVEfqnVwYl1Ftlos2ANpoJC+YPiDn2q117BVAcYHspdW
xgagc1axdHwtDNkkSrjGEKa25zDwa7BkicvLwmlm236jV3N+HkXQi1perWMgOOZBE8vKMuWN
6Pu4zRVuOBa5P5owTwPpJI+HmxbNf7hYxCr4cUVtHsSo+MZufVNZEzEfQE1mE0YUus2ro0/D
3HplfmZrhSOOxwWVJJOQYJOtF1JfoIsDUNhfjGY0Afb55dv768vz8+OrETlc7/qHL4+YVAyo
Hg2yt9nbj+/fX17fzZi8N2nbbfH29Oe3CwbnxaaVbUs1rmySrA/aQve9H1f07cv3F7iszQ8Y
JyjKQhXbk/w6rYJ9VW///fT++S96puytcGkFtTqiv/7p2oZ1FIHpKFeIVMjA/a3iYjVCmvIY
FNOBD9q+//L54fXL7PfXpy9/2kfZPerX6Q0Wrjf+jn513frzHf14UAaFDO27aYiC/PS5PQlm
uetFftKx5FwnEgsM+70+Grk+4FCq08KOL9XBQDY7cU+tNbqXJFxyJbjHVJt9hG2MPxyOBtRH
l35+gS3/OowkvqgFsaK/dCAVnCCEGs3YLde6DPrWjOENpVSQV3dqSLQZw3tE18UnM/l5dxg9
KxOo9ENnO9ZLxwcmKE2bWEbBqxhh4NGYF9aeUy5Jz2iNrqOqbitp+gRQwwMyYgMVo6el4RLp
GRlWm+BU54rOuPgM9PmUYO7pvUxkLU2mtowOltm+/o13/AhWmYEse1g6Bl68EShNTR1K10hp
xXdiPqg+GYDJthix812+Av7KnIC2yHkPzoHd9GSV86uBXSftpzkFTuu7FkUtgiooy3gobWJO
++sIkdaWDAI/1aLTtzpizRBfZCy+GsPBbjR+ULV0ob++P7y+2XG5akxWF6rUpl0ZAqXNclQo
HBU36xfP7pZVhYp7rgJvkn7qY3oMuYo5eMwtMO6zGsoJ/jlLtdfPLADS+vXh25vONzBLHv4z
Gtw+uYNvsHJnWQ2DnWUd3aikpJC4Nh8K9C+DM64xHCp9ryCS0kXGYeNUU1VxSCdfrtKGrgV7
nefFaJx9KDhMi6uUqKPDvgzSX8s8/TV+fniDG/uvp+/j7Cpq68XSrf1DFEaCO5OQAA6exjmL
2qqUXjwv6lHcyhad5RgJiKkWCfaY8hTjxuiAQaMKEgM/Uc0hytOoLu/dKnSU4OwO5N6wPjYe
U4VD5t+oZvlz1Wxv9Wb9c/WYD3fdgKVHwEb9VtAlfwwhmkkcjjuRNC7qC2JSGEtP0u+JFKS2
0YmIGOBrKPGpQ7cJg8wTJkjdekoyXas6MfdVZ8XfHj8TH4UO+vbw/buRh0ipWRTVw2fMH+l8
OTr8La4OmkU5Zyx6RFgXrwEcxWU0cV3G0q2dsdQkSaLsNxKBm0TtkSFTt4lGFYwODma1XO1F
c7heR4cMqafQmJapd+gVax9keXYPrCx/2+n0QWeMOE+pVFRdSVB3a92FjbqxNmoBq8fnP35B
8eRBOZJCVS37QIk9qqFUrFbcMYCBJ+MkMF+3LHBzKWUdtflp3ekYqPjvJvVXxXY+OhbEsfAX
d/6KVpGqJatqf8XEWEV0ApPHTe1RT6zZYB26MMw8W+c1ZtBF9aEZTK7FAreJ8ZAR6/lb4qb1
cfbdayl8evv3L/m3XwSuHKdqUdOXi4NhsLbXTnrAOae/ecsxtP5tOWyV27vAbCkLVJR5JxIe
nndZlAVkytS+WCQESs7HIE0ti0eGAG564R5oF0Xotm0W3ttZbfX1/vDfvwIL9QBC+PNM9fIP
faYN+gt3q6sqwwiz17jf9phOBDF3+ys8HiXEcI3nJ32gPr19ttdVkeH/Kjk6yhUOJJqcMtUe
hiCruzwTRzliEBy05lGmgitNFQqV3DmfIt3va3UCOMcpZpfUS6rmICmgrtl/6b/9GRyTs686
BB7JkCkyu8aPGHqp57j6bX674lG3cvfo10Cl6V6q+C0gDlicG1KgfPTxFIQVmQQNKfSRrgVI
q2iPYK4Th2bYPtbCnvbcVXS8L6LSCph53KcCWI71yrKgzillspsuWOdrcT0wWxCltDTDy6nY
ckr8N0IUakHNeAYfiO3kxm10c7PdLuB5dkoS/EEbE7REqDuuKjzKZbHwr9dJ4lMa0SnCOoIE
hI5JgrDc00/Cfadv4Ku7G/grzYd2eOd+G95uQuDv0BJChGcmWWwdqPTKTVQfSYLWmObWjN+a
gbKyV0E/3JzTyFAbdwImQEc3UD+TWIR8sMFS2mc4qMnIIEgQB3s4Uc23EQUVDkBHKiCBajfQ
GOfxy8Kwe8gkq10f+e6pyZyn/iYxNETdYoYrf3VtwsLMpWYAbT2XiXDOqvCUpveosKKl/H3a
BBW944pjkNU5jcMQ8zIXtMRVyzhVq043Kardwq+Wc49ERxlMcHUqI1Q+Ec/23WFYNDLJ6e+g
CKvddu4HdDDGKvF3c9NlQEP8+QAB6aqC26KpAbNaEYj90XMMWTqManw3p6w4jqlYL1aW6BpW
3npLmVPCdVHD2IFRKhbEQ1XFnRLmY4pSzZFUV5nI7NpUYRxR5mYYabwp68oSnIpzEWSSVvMI
371HdGT1qEAZ1nyZ6hZZYeDE8ukdNOBXU/hxlkcbnwbX9XZjeEq08N1CXC0nxx5+vS5p2aSl
ABG02e6ORVTRF1FLFkXefL4kDwBnUoxJ3G+8+eizabNv/v3wNpPf3t5ff2Bc4bcuM+87ahOx
ntkzCASzL3CUPH3Hf5qTXaM6guzL/496xzs+kdXoZb37EtFhKkDBv7DdRhRflDJZxXtsw9wP
A0F9pSnO+rXonBLvq/LbO0gWKWzl/5q9Pj4/vMN4hy3qkKCaPhySndodkMLNrqtFdSFjpiCi
yDJnuFKsIt1A8qIxHg+Hjh1f3t4Hagcp8IHRRqpOsfQv319fUNfw8jqr3mFGzBjW/xR5lf7L
kGX7DhOdHT41nZS17GzkOgfxickfpukQZZePZGpacbRNePGkChKByRo5wa87zDi1T493DM+O
wT7IgiaQ5Kdj3dr9Ca9y1JmR6vQPzSw/Pz68PUItj7Pw5bP63tQzwK9PXx7xz//zCiuKup+/
Hp+///r07Y+X2cu3GVSghR4zgXIYNdcYGD078wWCtW1mZQOBMSQ4coWqrAwkCDnYsYcVBGug
v8QeTQpQRktilHlIcdtRcicZt26jLJcVqcVD6ySDCSiVnJvruUqBClwM+UKBBOr1LR6+PlgL
VMwBVbdpf/39x59/PP1tv+OrWdFPmNOiTSsUToxOpOF6OacGpzFw2R9HOgBqIkAuIy1NjDG9
UTd1V8XPjAefR9Y+zdb1wsMn16h2RBJEYn1L0AsS6a2ui2maNNwsb9VTS3mdlgjVRE/XUpcy
TqJpmmNRL9Y0b9GRfIBzsWSyLPV7Bvo7vdb11tvQ9iAGie9Nz50imW4oq7abpUfzZ31vQ+HP
YS0bLgnFiDCL6OfIXnw+X+4Y/5WOQsrUSd1B0FSr1Y0pqBKxm0c3lqwuU5AdJknOMtj64npj
I9Ziuxbz+dhaFrPPdUreN1e+Vqnp4BYwDBQCiedxbWYWqrTXiVkmNJOSKIhz1qlm2/Zm7//5
/jj7J3CB//6fs/eH74//cybCX4CL/ZeRJKmbNaMv4lhqWE0dYBX1RNIXse1WO6igtAGq+wKV
5YETQ1lhkvxwoD18FLpCM3FltGINve444DdntlGb182v3VAsNIJrSar/E2sDt3DFwhO5h78I
hOKvKtOBT6PKwuhf927gDOl/2BN00QbShkSM8NoKH6JAyghCuZCNRi+uh/1Ck9Eag45oeYto
n139CZp95E8g2821uDTwxV3V58C3dCwqmq9RWKhjx322HQEsBI8P0PRvAh2I6e4FUmwmO4AE
uxsEO+4K1GfHeXIE6fmUTqxUWKAeitbC6PbxhQL2ywRFKdKKtkhT+Aj659P4FKR/ddzBncG5
h/U0Y1XBmGZ6KuD+vkXgTxKgN31dfJyYz1NcHcXkfq0lo3vUXbgvaRP4Dkv3rpWWi/P0d1lx
6p/2RrkuvJ030ftYW4azkpoiOoSM8ro7QifKymJi9jE/lZzYqoBHf6+J4dcMh6ex9+lqIbZw
5DB5Z5DoI9xFUjSev51o52MS3DohQ7HYrf6e+KiwL7sNrVtTFJdw4+0oJaWu33Uc0RxCeuO8
KtLtnNHqKrx+f+Aa7a4hwgijM8A4Bt7KpxehJWn32BSJXoQpCr2Wq6nNEDqb1LxnHWZtKMlJ
0SmZHqeLym16Y9UibaSTohhhmHjbfLZGWFE5zsYIRPNkUt+c58VeJRtwnktaVqCD9pXFp8rJ
IahF5CiKZt5it5z9M356fbzAn39RYmUsywh90Mj56JBoVHdPzvNkM71mB53Y67w6ttbItt1e
IJooPaE5T7SvKX/VTKUFwAcI42VZjjJDuQrbbq1L4UTh0RD4+OeUVU6Hna88ohDtMNwihWmM
1cHydDf/+28Obu6VrgkJW4ui9+f6bcTtU4diz3OXTtCnM4YAaxdotJ2U59ugjHZ8YcKnt/fX
p99/oBKx0g4cgZEFfWyFsF+ZhjerhWLmdds2PA1lTiPQ2oxCVGWwHxADP4qoqAyZV6wuINUe
Ps0q5uJqIIXzVNlBQeKRH7nYXmm9WS3m7oZVmPN2G63na/qE66lQHaHsQdrgXBP90zVebWO7
EbI5JPk+SKYGygbtahFNURND/SiCLRGRDAMi19EdsF6SqDCtBB9AzMTaj60kRRq2Tp2du9RP
7s1es10fo9KKHIbNnKMszMtmAd+QYY+hbym4oTZLCrrdmWtwzkuOcanvi2NOJoI12g7CoKgj
29lZg5RBZyzJ48+s4BDZ7/9R7S1IN3ezUALCkYRGrPRqVSIF7TZtFa0jO0dUICKHde0Q+n2q
rkaxbrq60uDTzQlKbb/sNNx6nscaYRR4KC5oJrFdwywVXLBTqL0BGfrWlH884cFg8VDBRzaD
u1my5GKldQS4T3PrKg3qhAtel9DcICLoqx8xNG8WJLe2zKnMSzOduvrdZPstcKXkZ6VTUOaW
UdZ+Sdm8w/mMCnBbj5Vd6WELTk6q5SHPGKUjVEay4/cgdqSu4RZQc/GPhqEJnTLJKERZpBtl
sEAmbGPRQFButFahszxZM1gfTxl6uMEsNAUdl84kOd8m2R+Y88ugKRka3T+8NEh0Ij+eXB9J
YpDHKKlsp/0W1NT0Du/R9HL3aFpEG9BnLvBc1zPgz61+uScd9ZEDy1rLjJZFxLWJBBm2OORu
pzByw/U39Skhw0ybpVof9r5cmPi0XVoFq4xvXNP1ATOfRBb3sY/8jEsTZZT7hBzOdN3x6YOs
q9Poso3T8wdveyVn5ZDnBzdGQIs6Wva9x4JTO5hFTsElIqMrDDRy66+udGeUwYK1TTwysg2C
5y7dnLHCONC6JoAz37S8ckXcK23ALNnW6W3+gbMpHCYjDcpzlDBhLAwyoAmynD5WTDrgkrkc
PyZN3hp29x+q8Lcf1vZstzDtfqG9L8jmgfDqL4GS3jjQ781y8VM9z6sovbGv0vvS9qSD396c
eWGLgePObtzUWVBjq9ahoUF0j6vtYutT29WsM8LYzDbfV/mMwu98JWP929WVeZan9Aec2X2X
wJJFsK0yYHUxRm4TZWQkXKOG7WJnrXyn4bryJ5Z/x1iwtGULwR3Q2RmuOIsZjPNSRGFEG9cO
BfM7Q2wC6lyQ9bdZ5qPsIDM7K9YRGGjY9uSI7iP0XI/lDfZaq+vMSj8mwYJ7FvmYsNzXx4TZ
stDYNcoathxjXGH28YQ2SCmZdXCgKkNrGOV6vryxqVvx1Sy19RY7Jv0Wouqc3vHl1lvT8SOs
5rLIecEgiDASo6Xj0JDpUlWQwjVu+BFVeOTjniJ3VBVFo0C8HSpPQOqEPze+4Eomdjy8Suz8
+YLSvVml7JdNWe04NbCsPObl36wvZYNP9+MR6O58HcU57fC1OqZvVHLK7M+uKO7TiAnVhAvB
uEkIDAuZMcewPN3oxH2WFyCwWEzdRTTX5ECHtTTK1tHxVNvaagW5UcouIRtRVBeVqbti4iDX
nGBt1HqWbHaujuQiP9084rWR9bC9W6Pr4CoxuK0YIZIExuymWhsqKx1BtT31EeEz715xGNJL
CYwIYxanwprumbiHWiuqdOKGShyBlp+ShuBjQyb1eIyXDkTJeh+QBhkKDV+MQEV7OirYynvU
FXi8t0NiKYARGa26AMSsMIlCNNs6HDBKydHisrRXhpQzhPNOtlXM5MBIQ7fGDtOqZRrdlw56
3W43u/Xegdbb+eJqw2BO0R5gBNxuCKAOnOpMQ6fxsKmFBNHf6VUrI9rAEITpUemwQPbMHwNr
sfU8gna5JYDrjQ2M5TUKbZAURXKqGmchtS329RLcu7M+rDXaEdTe3PMEszLJtXbrbaUEpkCH
BT54VFDJA1y5XqVuDW0A1x5Vn+LS2fEB8wxXSMC1mV2hWlSe97tk4G2oertrvdWdWx1tWQQH
CAzAeExKPW5DahAnr5bwi/pX2KhSVEwvziAIVVVkV9SemAf4SP3yoB/l7Nm/q7a73Sq1X5EL
xnSC1lWcqn0bXbh7PDQQIqitgw1hdyCiM0pfRBfRIahOFHeF2LJOtp7pajQAfRuIwt3WfmdB
MPzhZAdEHyuKhUCMLI4WG3Zx+KY+VOiFyRuEBYbXghT2zG0yZp5smpS5xE2q7kQjBmeSdXoy
AjXSjbjIEljJm/2YUipYdBGIYj8zRWWAN9ptMv2V3qYjwyuaFGZWahNeSxr+6T4MKm7e1E0X
ZaTKueVcyuBe9Oaml6c0uM7wHf/58e1ttn99efjy+8O3L2PHSB3XVfrL+dx4EzOhdlxhC2OH
g+0f6262bgyS4R+NTDjEY/ageUhRwqeVwq2WseHfijEylOSkzHEUUFmF1peMv9FagHGDsYkV
oAnJdMoal3i5UmipBfyKoNlfD69fVAQ7KiiJKnSMxYSnjiZQrr9ss0DgeOpoeHBO41LWnybq
roooCuOAVh1oEgn/ziLmoUyTXNZrJuCixsNifKCFg7OZaugMfNQ+sdOPtLBxcNPWYev7j3fW
FlzFKTYWH3+OYhpraBzDOZTioU7vZUWEaQCczMcORaWi/N+lAX2vaqI0ADb76hL1wdGe8TOj
Q6K35dFCZ7ofH/L7aYLofAvPTzcXykWXvIvu97mOC9rX2cHgMqQ1SgZBsVr5tBLBJtrSQQMc
oh2x6QaS+m5P9/Mj8MarG71Ams1NGt9jTEp6mrBN11Gut7TrSE+Z3N0xgQh6EjfyNk2hdjKj
xOsJaxGslx7t7GESbZfejaXQG/7G2NLtwqdvAYtmcYMGrq3NYkUr9gYixvBqIChKj3Hb6mmy
6FIzp2JPg3lg0BzuRnOtLvAGUZ1fAhDqblCdspubpE79ps5P4giQacprfbMyDBhTpJLSZhnH
lSGO4M+mqHwC1ASJmbdlgO/vQwqMinD4uygoZHWfBUVtxcMgkCCU2aqankTcd+Fox+3KONrn
+R2Fw0xBdyragHUh9/gILdQiQXP7RgcjZMIZBbzRmlpGMgfxQBTnAlli23JoQJ9T9e/JKrpZ
coqPI6k6BEFRJJHq5ATRXqQrzjZbU4j7oGAshRUeJ3Ucy94iOVfX6zWYqoQ9O9ux9ltmuqGB
jgu/39/RFZDRgoomUem1aQm2JcCZrUC+Z5w92i9QVnSHy1Qu6fgKx45tlb/mM9fpKyoda1k3
spJDoX42cjtf+i4Q/u+a8miEqLe+2HjMS4MiAa4ZtiaxbTU6kXt9yjjFaMthjWvN36zTqW2s
8lMrOWFboBQN2Yq+ZsnunZzpOQRp5E5CB2uyCrgYopKeIFmS5aL05M3v6CusJ4rTreud0Mp/
1PoPEQsIpluzqSDtPHzG/PIjIbWuLTXbmTqxTpm87rZNUd8bp652U2KBsH1PcNT6q7W9AkGC
OaR1MHXG5SzLP+XcA3tzYEIA4fGOoRAZRYQK4AVjpTSqoQrNcKpzDHhuKHujcxql1u87DWjD
XL4+PTyPLbfbQUZBmdwLMwFci9j6dpieHggNwMWmYjsb4XsJOh3yzJ1VhYpRC0Rl4TWJAFTl
psGP1QnL3dZs1cyeYSKia1By/WH4OZMkjVSOpRt9zsrmpIJoLylsCVtNplFPQjYUXesoCxnu
2poC2q/barD2t1vSCtIgAp6JWcFUhtyMpfk1GJ362cu3XxALELXplIsB4avSVgS89oJ1EDNJ
GC8xTYKTmciaTPeuKWyPHwNobDG31g/M99uiKyEyJspBT+GtZbXhXEU1UXtffKiDAw7jJ0hv
kcn4ur4yImNXU8k4HWp0WTD+dhodVwnsmFvdwK/lk7dYkZeDcyQ5C5OKukycoKEtCv2QLW7b
gKtScHK6NyGAMMtMVtMHbhvBr90IlBACwgkwJllopTZX0BD/RMIOGYMIDEOigvq6cIz3pZMP
WCqkAVfVJZcJUDep3oq1Ej0OSAtORWf7qWlQJRkjQsReMDlsmE80XWAW3TymzGcBvx91zTKf
uADblIXko0J2diJ1I88vnQeINroKqrlnnwkuYdh/95lQChFBvQuh+zimZF3OTQP2Abo0rzxR
+surPY3dyw25rdnuGRz+BThcol8Y2tf1gUIlu4Jj8gKLPzkWDFMP2/QgjhE6HcI1Q/t41wL+
FNRCgLwobEdIaNr9nK4ySe5HWae69EjjofcDxNUH7ueESbmKU8edoCg01rtagRgFhn31BfAa
ZXSQJqeCUKVEwJi31kIBQsdNpzYrIo9Qykwli8D0dO26lf54fn/6/vz4NwwFu6hCUBMXWVuM
S1jXoZNaLBfz9ag5YFaC3WrpcYi/xwiYgzEwTa6iSPRd3UXTmhqBPYA2tw5ylswYOum9X7Lg
+c+X16f3v76+WasGl9Qh38va7iECCxFTwMDsslNx31gvS2A4NyeuXCFm0DmA/4XR26ZTV+lm
pbdyryUXv6Z1hD2eiZKk8Gm4YWKxt2h0ZZrCNylz/yJejuQtE1kxWhKNTBlFACAxBBKtPkFs
pmxb+U5pY1j4Bk4siYoOtOOnHfDrBc20tOjdmmakEM2Zl7W4ohwn7FJRzJg9UomUiHGIB9V/
3t4fv85+x0RDbWaBf36Ffff8n9nj198fv3x5/DL7taX6BVhhjAL2L/sDEfAhObwNgsOokodM
xYywmVUHSQW9dkiqxLliOELu0RDJojQ6U6oHxLW9t+iVtiIOTkndJmMlszWoU1yps93ycBJM
xW7TeyDVTpMGrDcI1MFR/4ab5xswloD6VZ8KD18evr9bp4E5FzJHtd/Jd2oNk8wfdVAH9m4S
1FOx01bm+7yOT58+NTnLbAFZHeQVcIHcSGuZ3bcv7mpc+ftf+hBvB2Xsv9FdpC8C8nJmj1Jn
99N5HhUKt5Y9VwrUxmgdb0o0DeCjFvckeBfcIOE4DpN/6Pu1MBZUYFJWgLS5jwze5kKCrcRm
ypndzhqsYtyPyzSmxgWOlvThDfedGC6k0XOnCnulhDq7JjRnxb+18b+Naw09beDgZWh1u/vQ
LeEWMZeJ+PqAbNOz2WXgk2BKoC0chuojAvqzCnFE5nqjs/jiGjghCw1kZx9njxlE7i1cJHPf
ActYnp3pSa9S2JAruhs4IMfeGGGf7rOPadEcPurx9gveBe5vV95ZZ/jjROxH6BAihAsrjVR1
Eq39K2U9rGpuv0mriP4qUQaYKtW6wqLsW5d5Yo7TdO4/VvYPi+XWyv5KOslEBvDzE0ZBHmYD
K0Due6iysHOWwc+xsUYnKtZFS66Zv6LqGhgLEVgPSILoPHSnpCG3kRap1Krk5BtE7k7um/8T
8xQ+vL+8jjnTuoDOvXz+N5VHdozsuy0z1GQY0yMzLZgYBPAvQ/3fpnYcEP0I9NnZVknMZ4tp
He4dYCoKf1HNrUxkHa66eitGK9eR7IP7ugwYO7+OCITVsrw/SyZEZV9XmV+5t/K+qiDL8iwJ
7pi8px1ZFAYlsBm0NqijggMVZPFbTR6iVGbyZpNSRDdpkugiq/2pZPIvd9N+ykpZRaPEvu7K
YT5U41bB3WsZrbcA4NiqGhNCAFuTgtS28nyTorHTjnSFZPnRTaij9xkjBKuqugiHJqzduA5U
GWDMB0lcZ6n5+vD9O3DXqgmC99HdTcOCmhaFDC9BYZm4KSi+CXAl+u+K4LkVgWTELYVM7uFi
HCdgtka6366rDf0VaYIo++T5G57gfN2uaKFKofX9xY0PZc24fdPvlAb8ZOszDU6qX1osPuw5
y2HWHm+8renHrWes3m5G00iHIO1QC89za7nIbJ/babA0vPLWYunYEnUH7lTPewFPQR///v7w
7Qu5wcZ2Y+OdO6f2s++OoYW2aW9NjNL8LK6j0bVwNu9ISxRvVxt2yetCCn/rzV2tizNu/eHF
4Xg+RrNhx7HS8FJ+ykkzZYXeh7vVxksvZ2fcYbCbm4b5A3DlAh35rJ1QPPP4mamLar2ab2nV
zECxZdQMA8XOozUhmuJjep1q45Judzs6iwUx331I8Vv7ckKrpOe83jLvUHru4I7KJ84yTIGC
IT0axpqvI4o0FZOBRFGVoViMwmAbWeOpGUD2+sYMqGfCHRNe2/g4KV9VjRaLxXbrfruFrPKq
dIDXMvCWKr7V8KA17qE2x632VM/bUgTW7hMIOSdDxLlYcewuHjLuI6bU++W/n1r5fpBEzEJa
eFU2lTl1UAwkYeUvd3OzfROz9WmMd0kpRK81agdP9NPsf/X8YCVogIpaoQY4RruBVpbRArg5
Uo3Avs5X9EANii1Rp0ao5NR20nmLwltwRdcMwmdKbFWQNnoIpJu1TcH1Y7FoRCk4JDPwjZ1r
1EbRR401lGhORX2ySbwNsSPalTeYX3x3bIIz9Z6ncWVUmXEaDCD+X+XIdZDVqSgSy6DIhLPy
p0V0vKTmY1SB/p6IH0tmQShAHKrhM7CaRKlfF6FeKo8YILRUt+x8bbwQtRWphVjPabi9dhaG
ySVhklCano6g2lvCetdLAJP16ggeI7xT6f6jv7macXYcRPsgOOpthz6GNEvk0oV1c4JlgnlH
v5CJDiHbsaDmtuNRRhMAGI8x+DcKOyQOAVxR3ma+JNeuxU0tjSLxTW6565ysCiw8RkCR7c4M
1dghkmK78TfUQBFDssAdgfs8MLSltsJEyaRerFfeuDOwfEtvRYxLIeyoLybKX1HhNU2KzWJF
1rramvdev8nT/WK5GcM1a7kj1+0QnA4Rvv/6uyV1gnd0Zb2aLxbUSMp6t1xR95dz/qifzVmG
LqhVwx8Hz7Ls4R0EH8oksM24t5f16XAqT5Ze0UXSj6A9WbhZeNQVYBAsPWNPWvAt2XKYenOf
mkWbYkVViog1h9gxiIXH9GPnk4FmBop6c/WILIeIWHh0mkNALVl7ZZNmegaAYu3TLS83TJeW
G2rOKrFZ++QM3G0xhOJkV++8+U2aOEi91XF8BY7HjV4AVcqZrXX93dMh2AYCdFYkBlpfC28M
Dqs1lcESE0z6FDkGL6jSlJovfW+43msU0YoqLld3IOPRpqftTG48YB7jca+UGsaPD1S18Wa1
2Kw4y1dNkwpvsdkubnQ9rsQxJWY2roH3P9V441IdOCQrb1tRF7FB4c+rdFzzAXifgKwT9uxE
hUd5XHsLYlnlPg0icvEAU3B5CjoSkNbUYTtNtVpN7k98KcVvhuxEvaUusw79QSx9qhh8WqXn
k5HehmSTWQQX83hG9KVFHAwKsSMPMTR08lZTBxRS+B5d69L3yVEo1JJWdFo068mBKgriy0XG
Cf6jEev5muiswng7qrMKtaY4JJNityErXQAHRxzemHWVOYoVakG5qVoUS67WFbmOCrWjNc92
d3dTU56KYjGnDsta6JzrLn2Uxb6HSdk75oa4AgVrUt2uc2rbb43Q1C0I0AUJpXZqutmQ2zTd
0I6sAwGXpWQgmOaqgODGZ5BOnhNJuiMHvyO2B0AX9DB3K38xxdopiiW5XTWKYmf7I0tsN4s1
0UtELH3iu8lqodVCsqrzksCLGj5IciyI2mympxRoQKCeulSQYjcn9nNWqPhS1Fji7WpnfBhF
6ti1t3Q0GJlTn9qamHxcxHFBlJHlYuXTZwigtvP11IrKsqhWyzldukrWW+ASJjeEv5qvCfZb
XSUbkttvUWjwekoCx6CMol5sval91R7m1KkTXP35ZkVfAHDEbUmmDHHL5aQYgOL1ersllvUa
wfVBnrwgTC5BzudcMHqi1WK9mTr1TyLcOZGHTZQ/yYl8SqB3xCdYHWvq6gYwdcgDePE31QFA
CCapUUcxYS/a88tp5G0W03dUBPzrcj59pgKN782nrgygWF/8OTXEtBLLTUp+Fx1uN3V0aKL9
guIHgKlera9XtGRPbQc9A++TV5FCLejXmp6mrqvNJK8G0sya4n7gDvb8bbj1iK0dgHw098gv
BlCbrT/FGSmKDS10wxpsJ4V/mQX+nJDkEU6dwQBf+DRzslmSn+YxFaQCrydIC29O3KQKTrAX
Ck7MIcCX1G5DONXhswzQp4KTHQC93q6ZtIwdTe35zAviQLL1yVeIjuCyXWw2C1LURNSWy2Rn
0LDZ7kwan0ruZVEQc63g5LbUmCYOOCspgzCBy6AmLleNWluWmQMKPtIjIZtrTHSMqV5d8fFg
9LrHma33Xwk6y/yEPqW+m3setZUVHxVYwdtaEOamqSVGHKBU+R1RlEYl9Bx9q1t3MVSMBPdN
Wv02d4kdDWYHxlDtGLgAo4manEyHDyNtaX7IMRFuVDQXaaeboQjjQJZw8QSMMTJVBP3sMSKT
+Pki7VtVkuSCZVm6cnyvCMLJcSIBmgU3TBBYk24YFFfT/80YMEVE4GbBaUM9vT8+z9By/avl
fd5XoaOMqsZEEqRUUDTgnpriDh/K0qLfmV/dKqpcNGFddQT0NwOki+X8eqNDSELV079RTtY1
Gps4TlZGT5Fht2A8HxL1tFSd4+bwnXSQzpVkeKDtEFl+Ce7zE2Us19Nol1ednzjK8HsMiSYw
QJEyNIba4AMfN6UM/0Zrcnl4//zXl5c/Z8Xr4/vT18eXH++zwwuM/9uLY7DQ1VOUUdsMblK+
Qi64WJXHNTFXrWaWQawIxKCjMHDDg2eUfZqvd9PutJcwgL6EtGlgG4mVqqCl+CRliW/o474p
cFUQmNZHgOxzeJlqDVVBi+uVqDMQH0+YUxJGYlanMhRjtCB2iEEiU/TCmyTYABvJEkR70YDA
t3QJWrRSh29HPauKFYg1wN+RGVOhyljWhfDJSYpOZU4Nqvvi9xuoWbfXg9LANB66BDGcq06X
5Hoxn0fVnh2pxCx/PBbGwvWoBk7aj50+AdDtwrGYWv4KWP1+ZIO1BOpivAXbr+zMzPJ6rkdj
7MzitLIhKsxxa/o5xiw2+814ENrwju0Pcsj0NHXsmd0QQLebTey2AuBdC2bMHcTxE9MQ7q+o
AGluQe6vTO4wOjk7oVJs5t6WqRujLQS+13a3Mxv85feHt8cvw9EoHl6/WIcrBkASN06q2vEV
6uzauMrbgkAxVG0sIEZtzqtK7q24LmZ0WSSpWncys5SQx1zZyxClO6wLRH98t9RwGlgk1Iph
T0KZT7TboW2o9uTHTqkgI1zjNhnTgZbIdhndizQgeoRgh0j3XUiGusebfRsQwFpRNguIHzrv
1Nh1GNMBizRjsOPhdH52g//9Hz++fX5/evk2zhjQbfs4dNxlERJUi41nqVYVDzUyVla0Qe1v
N3PeSRGJVHi5OemLptCGQbNd+bXw51c+2hv2vkRPUGqSEdv7cVhlNNStdkxgeTKqxqrlJrFV
Mz2YcYnv8cyzQ49n8rYMeEoJplZG2VpdneVyjcGxnpZVc/wMDQw/I+On9Q66ZsIOd2hKLdgi
rdjyCqbt0s2VEN7CMmwzgOP16RBW+Itjjc7HlRQLGwZEXcQHowoteHw8BeVd75dNDjApBOu/
gjg2lEAvcrkxOxmSRhzry88SoqDDRLLuB4fRqpSe42fo2MDYQPYhyD7BCZWHXNRGoLkDyTOh
1E2I3G6L1EqEOgBHe02B14zLnP5or95ytaHV2S3BZrPe0brsnmC75HastvXbjE8TAPv8163w
O+pxZ8BunX1cry19toJ1UtMAjj6pMCeF26OzLKJS+ZiynQJZkI41gchCxCv4cPmJInwQTOzI
Ek9BxapeMY+ziK8iMX2JVHK5WV+53PaKIl3ZD2w9cCKyKJLc3W9h61AHrK6hslNN76+r+fjG
M0vcV8J+fEdoLZsgXSxW16auBBeHGwmTYrFjd6E2H7X3BtScpCe3vSJIUjJzGppbevOV5SGl
TTBpjaZCbZxDuHMHoqC7EZuA8O2SCdbdDQFGtuA2VedbRFW82pH9NtA+U2zqyutJRtcMYODU
sk0b60uynC8m+CAgwOR6U9vmknj+ZkEwZEm6WJnOCaoTSl4bffquP6PJTWm3MofX00DXQNxE
VRM3hWJNfOrhWw0oXennHKsMQtkFU/5dozNWQWnTkBa9ZKIgtuiFN81GtiRTQ0WS1Xxiw2jX
tLEuqVcimoGlONa8L9w92ptT0QNZ/4qBQierOudJbdmmDQQYt++kwjhm1cnx7h+oUNutlN09
3WSrcEsfnK/UQuJ1P1lBIOrt1nwyNVDhamHelAYmg78KEuOIMgOG8KI0ptdhqW2M7cDg4GhG
wCLyGSNlh4h+TDRWOMhWi9XNBhmn8oFAVsluMSenHC1T/I0XUDg4lNYLZqXxBttQL50OiU9W
jK4TbMXbDXnA2SRbcpugictqu+NQ682aQiFfudpyqO16SVaoUHYmZRsJnOTkMBQNt9NarnG6
glYYsq8TG7+xjbps5JYUOQ0a4FI9jykPOJ9iYWwS+6QfcMjVThYu4tOnyLKwMXDn7Xa+5lFb
ZlUUkrTGNGguKV34I+YgxLAvk8V71niEqZLDypvTA0JjJQ/mk8F1vByJ8xfcJtSs2o1FGvN+
Lo7+Mgw+kMZ5/HBWOmgojdOXC43TfB6F69i1Ec69s0UrhVhTNiWYYOo05c+Y2+F8lRLu8Prw
/a+nz29U4MvgQO3w8yEAvstQ5rYAFcv0UJyq3zwjjCkiq4usMQgMk2Q5JMPBAbQJCxxtpy8M
gM4MBts91xrg7i149s/gx5enl5l4KV5fAPH28vovjNP1x9OfP14fkKmxavipAqpE/Prw9XH2
+48//sBoX278+njfiBRT9RinGcCyvJaxmaTTmLxYlqmK1AerFFql1KPsOar6tbOwAv7EMknK
SIwRIi/uoc5ghJApcFr7RNpFQBak60IEWRcizLr6tcRewUaUh6yJMth3VJbyrsXctPuIMbZw
HJUlcISm2hjgaR5GbfzSymmrlonqQu3EUx6v1VSKNZwcWZZu9LkBW6S0BhEL3u+j0qcT/wI6
KIXT5aCSCcwL/QKklqiqWSR8TXZ4hgF1wq1izVsLMMtntGMZYI4Hl5ZMS2QsoRd2ek+rBRUn
lOt/Kc8sTm6WNM8JuCTazleM4T3ukFGcA6vRIOQy0+F61Peez9Yc1HTwOpwAJh0hYIIzfBos
VrL7jItxivMa5fC9MdpYwN/dl/TpCrhFGLOTc87zMM9pPh7R9XbNZNzCz6+UYcRv5YAJwKW+
KLZSAQe6zPjpQ2UZsyXTSpziq/URnMLE2aFoPn+41kvaT0utgpI67TMogh2W5WnkVIbhnXzG
V0WtdVokE0PZuHFm2huJvGbUkbV/+Pzv56c//3qf/dcsESGb1hBwjUiCqhplHkdMsoznc3/p
16bFqkKklb9dHGJbua0w9Xmxmn88E3OGaDjUdr4tEnXgBemahtg6zP1l6pY5Hw7+cuEHlMoG
8UasLgMapNVivYsPZkCOdkSwYe5id6TH63ax2rht53W68P0VFdgIo4OoyLDuvA5vqj1Fa9U1
WYurMRswhRldZQD3Ej/RoJb5yY02ECkP2xs0BXCbS6+5OJn/RnRVcAzM8HNGK/0rLIXabtc8
akOilBQ/J9tSqB2JKbar1ZXBWMK30QdHE2OspxPvwKjtDGPdJBSjPBDtQxCANnQFwCFcRUbx
SQNNq6YzNXQ3zoF+p+cHq+P4G71BMZ48nGf00+BAw/EbBolITrXvL82+jWSKrliVnzLTgxh/
NnlVjeQZG4N2gfDNkSl8K6vCLGy6MKAGqBCpDThewqiwQWVwSYFzsYHQATR+tYGpvEYloqwO
62YQTHdSYYm+HUsCGN5nAb6Wwj2YmynUVfMgZWEui+q3hW+334oJTZ7AaUhmK1b9KHPRxE6l
Z3yMwyx+gORxmF/FHTSn5VUlRzGUsUAKAs1hf4rdmqro4wnNFyntrSrYJ5R3Zp3MtaxKnNL0
3qUPMCAvue/V7NZFQKe81V3UyYi89YqJA6PqKE5LkkXR3ZWjHoXedksnI1XoSh4Znb9C11Jy
SYp6tJKhmFxHSHTabrmoFC2aSbfboZm4/gp9YfzcALevt0xsTMSKYO7NGf8mRKeSe/pXH+/1
/sBkPFSlq6XPBEpq0WvOBxnR9TXmmw6DMgkmZuyg3JhYdBLcTxbX1dMB+PrqebSunsenTmBH
G8mIKIiLxDFf0DaGiJZZKJkY8AOaCybeE4QfbtbAL1tXBU8RZZW3YB6BBzy/b4hsieZp7ySG
HyH5bxR4TW8zsWrKIGZ75XveEfBN3OXlwfOZ0Jdq5+QJv/rJdb1cL5ksxu3FySYUA3SW+kxS
FX1uXo+MvxPe3rKoQRTl8Wm04IcF2B3fssIyvLW+FJhwouoKlMGWkw8N/I3zWUmkecV/Guer
z3kTA/Y+jSkD32P4i1J6Wj5mah8GerOQomlf6n84RYBJU/5EIPR+in5bL51ZYhmSk2UYrAFw
p4ROgoIWcQq8ie9LUVRXn0qt2eFFIIOPVNUKobPh3mjA833Sh7AlWMfSykXYgo+yzZhmXoAi
9K0nlY4YlcjrMbjIQxJ4DKkR1XkWuVp/h+QcAEtzHfHLQgZuhedrkYs7JimZKhaqVRN0ThS1
CXImuhPgnJC6eofKcKzZONr5KuHnELiwLqPsUNNWjUDoZPXtUSdsaDxHWPUQv1yHqf3++BnT
GmIBQpOMJYIlm7lboYU48bmuNUV5ok8MhWWF+B4r6YNS4StGy62QJ/yEWfQ+Su4kzVBpdJ0X
TUyvviKQh32UTVHoTAETaAm/JvAgLAUTgxf56RDw6DQQcIDx1YNwFMq76J6fQKHe2ni0ThbP
4mF/HnIV/J8lidJqagIxxfkEMnISLjpo+n5RuE8wbhZ7iNK9ZCw5FT4u+WaPeeJkCbbL1uvt
gl8z6Nb0x3R3z0/mSSQ5p1JH/CVIakZWRDRmtKjybKKCw305cpy1CCS67PHYmsd9CPZMJHTE
1heZHSe2wh2wsRJOyomuJYJ3MVd4JnmxxmX5md9NOOuTZ6R66Ujz08SHkMLalBPdT4P7OAkq
vo0y0p8bX4NEx408ZrJwSiUowbUz8WFgMng5vT8zxhZe40pJi1OIhXt94rspggzdiZN84rss
oizFxOgTBHWAOS54AjiQUfvI4uE8wmWSTO5tfazKNOCbKPHlZeIjKXMhAn4IcCFMTVMVpNWJ
ycWr8FP3jQo1mXBZ3hVFHQX80QfYKEGdEiM0KZpTViQTd3bJJKdXx08ZRVlQTdxIVQoS2Yf8
frKJWk58y3BAVtHEUVAf4Zzhp6A+YrJYrSfkz2lk3JqCeXDVJ/XUzXaRMs0nztKrhO+AxX6K
ynxyfj7dh8CyTZwkOiJHc7Rz7tmsV1LQue8ohrNPO0Dyx1rUGPHIhaQXqSUPozPZvtvMkLDV
aruvTuWadZsykxOO6lIBEiSc1FyNytMHCPh66Sp6idVs0hh1fhSyQeORJGqNVQYxCPEjsxsl
JDpxmpSwWgroXFA1RxFaGJvMcqNU5bIMjl8RNVl0aZ8T+7Rn6dPb58fn54dvjy8/3tQqvHxH
MyRL3MBKusgkaB0jSRdXRcW8KKh5qA8jQHM5wrmZyMqy7umQ+0Q9TVW1u6cdutiM6qqk2iis
0GrggEGv0X14NL+YoBhkFLiaQh1U5jffbt8JwGpgLmp99kHsdrlHjF8rhk8JUwuTmRytqsR6
c53PcaGZTlxxU+l9YBVU8HB/oK1Ge4rRHtFQIjsVIqO2MW4Jriffmx+L0b5UweK99XWMiGHZ
oAw1AhULz/em2hvGTkDHY+sxlfupDGWYkZ+mR37yFv64J1Wy9bwJMExL7jakkWQ4JESX22C9
Xu021IRhjej1zBQdBj4qpZJGpA7X02/VNvqJeH54I3PEqs9I0NehOofwIY+5btXnEvJlazs+
t440D3fr/5qpyarzEi2fvjx+h7P3bfbybVaJSs5+//E+2yd3eMY1VTj7+vCfLoHiw/Pby+z3
x9m3x8cvj1/+X6j00arp+Pj8ffbHy+vs68vr4+zp2x8v9kXX0o1WTYPZ10mTBnUewCKaprcK
oI6iYrTz+qqDOogD7vTrqGJgwUTunIIdUlao/OMagH+Tqe1NmioMy/mOqwGxpCeCSfThlBbV
Ma/pLgZJcAoDroE8i3jpxiS8C0r2O+hoWu1IA/Mq9nRvogymZb/2TadsrRTu7038QOTXhz+f
vv1pGQubB1kotowrlkKj3OfIDANaFo63goadqaNvgDd40VW/bQlkBoyhqH7zbJQdb6IlP4XC
WQmATm3xVB0ooZkXaADn47tdIQ5BeGC0vD1NiF5ZZZ6MD6ji+eEdvtevs8Pzj8dZ8vCfx9fu
W0/V4QX74OvLl0dzUVSVmAwrzxJKc69avJjO8R2kOSV2pIAewYT76PF6lGTRnx2cZhFmFcWA
q4pGF57uWVBUI7A/hnQrpM30H778+fj+a/jj4fkX4FAe1RzOXh//94+n10fNH2qSjtOdvatz
9fHbw+/Pj19GTCPWDxyjLI5Ryah8ezpyPojqmLf4oR53p45J6hIzJaeyqiKUvWNa6FKM2FFi
umVatO1YnI0dK74/INQEMTentvEgi9k8+ShSieLIUrl21hJAZlISdTuHp9pM96vbPVfRwd2Q
pcxpO1XNTR/y2s5GpcAug9OdrOJ+I9YLF+ckW1NzFyrlm8Ma1qFUCma3j+rNIYT5Bm6dO+Ml
8PT782F0k5BxFxSjUQYgGZ3lvnQ9TFUH80tQwtzwTAybbVvzzZg2THFZsbzWJ9LdWW8itL+L
L27791CEcgNXlX9Ss3X13UIgK+Hf/sq7cmzDsQIZDf6xWM0Xo+Itbrkms66d9KPhHZp3YL6i
qHIlq3rMy6ACa3SDm7vjio9RI+Y7Cg5JBPWxE3xVzEtKfkXFX/95e/r88KwvB/ozKo6Gu0yW
F7pSEcmzPSadINcKn959+4s2zoKhx2BatiokrwUNvXGAmUToTkM6TowJna63SBwTvgddfvMJ
bMcPZae02Z/iGM3ifGOGH1+fvv/1+AojHSRae4I7OW/MUjSHEqHsMDuJhxlccQ38jXO0pee2
HQe2GMuYWDXl0onIfSjaeuzLmLyAkdixtVMfQRquVov11ACBp/X9DW1N0eOZHA9q/vI7Om6J
OhwO/pw/l5TBoivW2luYXFr7DNiDwFHklaydA/zURHjWu8DO1MLcHU0mUhcURSNQddpbSRk1
tMzgMnCB7j6PgWkXHgXDay0Q9wTKd2G2xa6G1W7P9T/jyt0KHZy48Wm6KZm6J8r37MXQ0+jJ
pctHgrJydknIme8JiAUYCkd828URBbrbY0zR/aGT0G9Sx00CNw13GBpk7hYxUOO94iDJTWPT
+Cyy3UZc90dqZ5qMUKvQhNYOre+LyDqCFQBoGFNAjT6hVoVHa1fj7ZW8f+v/fH/8RegQH9+f
H/9+fP01fDR+zar/fnr//Nf4YUHXnZ6uIKstkEmZrxa+e8f+39budit4fn98/fbw/jhLUcIZ
cQe6E2HRBEmNGjJnJlv/QwNL9Y5pxFLsgbzTOi6PeHJAVe2zBKpn2c0BXHHjPuGaRy/Iro3m
XYZiF4o1TM2QWvCj2Se5maq4B3X6/e1QI0avhO1PGoFhuZZR1BJ6Kn6twl+xyM8oxLE4p35A
XBUe7Ru4B/Ix23oKPvrbUElSx/RXogYm4xS1jUzfCqJnpRT5sWHeqpFE7DeMnTxiMQBtFaYp
GX0H8Sf4Zub2sp2qo3Ah4VGuYZM5lJ1a8mQqy1WnPhLTXOfVUe6DyYlOa/rlOo1STAFAacDw
pQofcYYeqCcd5RFndmGANrwZhiLalyhiZSifHi+YEDU72M/JasehtcnoLFDlg+LkdEY51s0p
oE8BF6N+o1cZmYVXYXXckFGhQgS71YItZQdD1c1gDLXluHUAk4HeWuxqZaaLccuuVmT+lAG7
GPVitVqPJqbYrszkJB1QO865qxydc+AJJGUSO0yN6YxnQke+dT1yTUZaU2g3+FEPtKPRtGDh
+ctqvqU04box099SQczQVtZmDYHzHzfRBrmslj6jV9Y7VTtGsvuqD3ZjQmsRYHQTF5qI1c67
ujOA+3n1twM0ozI635J6Wfn9+enbv//p/UtdkOVhP2stu358+4LX9dj+YPbPwbDjX+Z9oKcI
lRAUD6s7k1zbkKYOtLR1XwqMgb346cRo2ds9u0V0wMHRe33/gfsq/08/IfXr059/jk+X9q16
fLZ1j9jKe4/tQ0sEbHX7xEJXktbUNWWRHCO4wvdRULs7ocX3zqJsI6I43WokELU8y/qerYMJ
1GXRdAYJatbV/D59f0ct9NvsXU/ysLuyx/c/npAZm31WsVZm/8S1eH94/fPx/V/0UijNYCWj
bGKkAawJrRm26IrAMd6kiEAiCqMzM+uFMjx3t1c/na4TQyBEhBG6ZSKZuBIS/p/BvZ1RGyKC
o6yBUwkNOSpRngw+QKFGBitlLVAfYAMwW9p6621bTN804tSNTbQcYrjpzj5lBOvDevd1Gbgz
bXOB70Cj+DnoGxplByt+DsL6OIDAHWRRYndCcYoDBJmkMmjS6hCagdJbKyKAra0rt4XnQR2m
9JZRYbOOWLJJDyktHg801ORdsJvCeTdsodastYQOz9Zij9Wp0UPqJ1A8Pz1+e7d48qC6z4D7
uzZMX9LA1gwPU96UgbIa62rfn2LK5kjVj+pNUkfllOsX5XRtHwiGlo/hcrnZGnyaTLH7Qkr7
BQO+0ihpGUO4zKrKChapsSpWUof7xz+G3kKxEuM67JMmZ+zmTRLKtMjAK1Z2aLvFGHoF+3OH
n42QMVEnYoqwPKN7iSw/WjVgzsN0QPx/lD1Nc+M4rvf9Fa457VZ1b1uSPw9zkCXZVkey1aLs
OH1ReRJNxzWJnbWd2sn++geS+iBI0N3vlBiASIoCQQAEAdSaH1n8loCDzTJYW2IkRX9gMRF5
KRANCDs6Elc0kG8slxc4Np2PyCSrfO1Sd7e3s/VusYnIU1r+jKouy99ck0FnETWYXi41csbv
pGFNucYYF720zlL8MRVwk+SridkzhFt6eDyfLqc/r73lx1t1/rzt/XivLlcqunH5kEU5HXr5
s1aUNVn4i9gSxSzqa9VRVNSAm3WUyq1FfeVgma/TqH3aYhZHSeKv1ruWjFpCyR0P/YEPcbdR
8i4seVoLwPGrg5mvCkeptXFcI5CC0+vr6QgS7/T4l0yP89/T+S91JrtneKjadGCpZqCQsXjo
DejLhBrV8FeoBvTlXIUoCINobLnRrpIxficQFLafEYLhQnKOZbIUrrtnWbziHiODd+VD7PR+
pqpxQK/RtijjiTtULBXxs8Q+KaCcJWFL2Y2Nar91Z4AVCXJBEe8Bzmteb+6zNaX3xzAzG0UL
kpET1bE6Hx57AtnL9qBZcmVUOTXq8pb8hBT3I/QafKzgp6FEGrOaV6+na/V2Pj2ac5pHPDqd
p95Q54l4Qrb09nr5QTSSgcajKHr8p9igkIonoEJZWYiz4jyjlqska4VwNyTUdUMtcrXcyxuv
8o7kCZT7+8O5UhQ8iVgHvX+yj8u1eu2tgT2fD2//6l24gfknzHrnYJRZHF9fTj8AzE4BCtVo
cjYSaPkcNFg9WR8zsTKt1vm0f3o8vdqeI/Ey+nGXfZmfq+ryuAdW+XY6x99sjfyMVBpL/053
tgYMnIyg32WDv/82nmmYFbC7XfktXVBmao1dZchVTrQomvz2vn+BSbDOEonv+IT7ZBsm2R1e
Dkd90M2WJavjbYONOijqifaWxC9xVjcpmdgK53n0jTKzdkXQGa/R31ewTc2Sg21bklwUcPzq
B7RHtaaZMx/2JdpFVJNYq0DU+Npe4dUpp1RmppqMB2t7uBpOjcmK1dAhKxzXBHkxmY49xXSq
4SwdDrHvq0Y0gRg2X/I6p8KCYlXBi7mmJgIZkG3WQsuAvjqjUHDnsT39Oye8m8dzQY77ra31
KOxGoGDlv+rRpPKMQSq6ZzyyriVxVRJ2b6Tjq8Fki93Qoq10eEgR9/hYvVTn02t1RevGBxvL
Gbm4wEgDpOrI++Eu8QZKWvUagKsTNUBUZEIA1eToNYCk0ks3zFLfmVAsCAgXF/CapQFwq/Cc
UP7l0HdVEzL0PTWBG1ijeaiWCxcAp68zWV2hS/ZSHyVb+Y0VNZ3n72JKlb7bsVDpU/zUz5sk
kC7UcLcLvt45fQfXpwk816OmLE398WCofMMagL9hAzSOvfzxaGRpdjJA1blS7q539NIfEqq1
CSCyNswuGPS1skm7YOSSMeos8D2cGaO4m3i4TAoHzXw9FVez1eNVIlfOcQ9qA4+NfTr8OFz3
L9zvCAJdX0egzi9Eubqk8FVuHjvuAP12RyP8e+povyfo92CM6Ud943cp0oSUYBCB6RoleC0r
BHRGFSAZa2MajyYlHhVyu/Df2qhRcXX4PZmM0e+pi/FTtcAA/z1FaSqDgKeNd0qtoFC7ZnmV
NdhBfByLxiutWR5ZxpOBp7D8cofyNsqDqtJXY86SInAHY8SoAkSfCnEMqm7l75y+qwEclNxf
QiYY4KnhttwqHanjTIPMc/s7DBi4LgZMcQEDXgb0uyNfjzqg9TdjeURVA4S2v+XaiXlm2FYE
KGNbsaeOZEt32BEAHq3tQoD6E4d6rEGqZ7INbMD6rmO25LiORydqrvH9CYOvZO3McScMFRys
wSOHjdQIbQFm46l6ywRgRRIMhgM0rlpR3RmT14igW+JGFUjz8+l47UXHJ2ysGMjaMnp7Ab1W
E1kTbzRS1WWFSmqrz9WrCH5l1fFyQs8Wic+Dv+p7yt1Lz9JopEoK+RtvLDUM7fpBwCYqn8f+
N7xrgH057qsJeXnPcR5zLXORqWf3LGPqz+33SS1aGm+C/lYyb9DhqQb0YMeu3SHqzNIEquqV
sno6WP2+0oJlWfOc0qiqHLCsfs647d2YKkYTSBMstG5pHJpuDVdPtXTj12wHHLiXzETvd8P+
CO1rQ60kB4eQChsgBi7aPIaDwUj7jTaH4XDq8uNK9XpBDdV6HE49SpXnmP5Aox25g9yyI4Iw
d7QyN1y+j8hYDd7UBI8ffutqE4dOR9ZqXYCmKwAJxERraTyiAjYEAn8TuUuryoDXp9QskAUT
bAOEbDCgK6CNXM/D1c/83dAhK0EG2WDsqnomAKYuFqehD+Lb5bEWOng4HOsiHaBjj6xHUCNH
DgovvMnM0hMCa/np/fX1o/YQdCzO14iMro62i2ilLR6Rpb1NF2vBSBuM3SBQLNjGkaIPqC5M
Uf3nvTo+fvTYx/H6XF0O/+NhFWHIvmRJ0jjApKNU+CT319P5S3i4XM+HP97r6iXtx54OXcLB
anlORs4/7y/V5wTIqqdecjq99f4J/f6r92c7rosyLrWvOahdSHUEwBjds/j/tt1lvL85J0ia
/fg4ny6Pp7cKeEbfy4S128f6LQc5HgEa6SBXF3u7nA1IZ8ksXTgok7n4re+NAoaE9XznMxcU
R5Wug+HnFTgu8JhtvD4qTCwBupldbwyLh3xtNVbjYuE1l5C1dWZOs9xcq/3L9VlRIxro+drL
ZUzt8XA9YSeZP48Ggz59OClxpHjyd15f17I5BMkFsmsFqY5WjvX99fB0uH4Q7JO6nqPIrnBZ
YO17ydXMPnX4sCyYq+6E8rde51nAtN1kWWxcS0rLGNQk0jgGhIs+mvFOdXIVEI88fOu12l/e
z9VrBZrkO8yRsWQGfWN9DLDuF2v8Hnf8rnhr4prjKb9GuhupWuFqyxl3JBgXOQNVhMbRCspW
CLPm+oSlo5DtSB3sxrSowp1PA46fUaGduJdBZCIZf8dRStBPBgZFQi0+P/walgy5rPwENmS1
2IGfhWyKwoYFZIo+xtIZD7HbDCCkwhaknutMlA45QDXC4LenmvfwezQaKg8sMtfPgPv8fl/x
pLZaK0vcaV+1gzHGReqPgDkuxeJfmc9zEXft5FkO1ptjNkxE8RY5XSQm2YLwGAQMCRQQPjgL
Qw2jU7KvswK+BtV4BgN2+xypNsZix/EoNY0jVN8rK+48z0EOr3KzjZk7JEBYrnRgTbQUAfMG
DiVaBUb13zazWcAnGY7QdAqQpS42x43HpNHNksHQQ9d2hs7EVcJltsEq0edewjyKI7ZRmoz6
Y0yejGhP8nf4Tq6L74DiJSojNfY/jtVV+giJ7eBuMh2r7vG7/nSKKoRI73TqL1YkUNcHOoTu
iPUXnqXicBp4Q3egxklJASeaEds6jeKZuG6gYQA6umGBZRoMJwPPitCYT0MiVaVB5qmH9nEM
18W8hjUkfRMgQ308+Vm7C0fIo4Lg9Q75+HI4GgygbBUEXhA0EcO9z73LdX98AovkWGGLoy7u
QR/uiNti+SYrLGc/PJiX16pQ0HiPe2DzNtaUnB96hEiVfjtdYe87EEdJQ3eMDMOQwUKjZQC3
GQcTSiRKDK6VDWYj7A8WC9PxsH8USxBB0cfnN0WW9DWvn6HJam9JzgDMEI6kTNJs6vT1gH5L
y/JpaV2dqwtXKghxMsv6o366UCVC5mIti//WpYaAoWUVZgxtFcsM5wsAo9RxhvZy4hJNq2mA
BFGkGvpsiN3W4rdRjl1CLW0C0hsbgkikpaChpPtLYvQ9bjgg3SDLzO2P0BC/Zz6oOiPygxpf
rVPqjjyXEKXYMW/qDcnWzOdq1jj9fXjlWjqsxt7Tga/KR4JRhFqEL+DEoZ/zZIVRuVXPB2YO
Ut7yeTgeD/ApPcvnpHHFdtCFKpKBDiln22ToJX2iKH07ZTffpo57upxe+E2Tnx65uWyKLBCX
OZpd+pO2pFCuXt+434NcfyCN4rQU+U7WwXqTJShvWJrspv0RqSxJFHaUFWnWt4TyCRTlQytA
ZmPtUEBc+n4xt3WdiV4To5HtxIt2j64KOl5im0b8ximlvKp3oOCH3F7UoXJgkjFmvVLYEdgj
QTmNuNslPIRyB86/9R6fD2/mhWN+iSD3yyYOutmRdXplW8x4+qCZJVcrCI+o4FEaRb5OErxn
yuW5fOix9z8uIo6oG0YdNI2TksyCtLxbr3yR0aVGdTOxfOCJMEp3skpF3hZqJlQa3ojeQMAr
jHOM5WFx8CYTwyhfDiPiAKPqdMdNfwqmABDYW2jB4floqXnGIRga0kfCJAKF5msUkNeMA3TR
BH7ar6UCLsnMHINZdea5PoSAeZVOHhRN3Yz4BpnCCD7NIMVyswp5tbPErJPtH5/OpwNKpOWv
wnxtSUnbkCvqRDxbbcM4JWtdqxU4VrBIURi2AMj1SPO1rA5YRjyG1My5s7zvXc/7R7EZ6SuM
FWplvCLlNQ4KHjSPOKdD8LrNBUZoXnMOYutNHkQiHmqNZayCbS+0UVtTRzbnKcFQGzICTi/y
0bjBzJdtvanZQnWryEjiLC+7jH5tF5y0TBd5S8Ws3iadNNjSUdstXX1mTOtJLVXqB8vdWoum
EthZHofqBZi6X55o8ntkYOveMn4tT255udZeHi1i9YKkAIbzxJgPgJXzlMqU1aL9+YZ8jL6h
IbLjw4h2nRNNTRRBxLLy3BN+uBhPXfqqVo1nzqBPBwpwAssdRo5q73yY5qISCNs0tlnFfD1s
Y7BVbXsOi8lIdZbEqZb5gYOk6A6KnAp1E/Yi/L+SVdqV+wAbM51rY6bgqFV5+nR4AZVByHT1
6l0AHBeV9+s8rK8pKn4an6ufoHryHDF+zhAPMR7xjneDaFe4pUVYAc7TcB1mgHLACMCGRbyi
vGhTQ/HRrFkMnzxITBSLgk0u77KqmOaqYg37Ogtd/Eun4PluZmJyFDU7imESeDIX9AlbMBBb
AoFbElGGM17NKVZUmi93flHkZCfq6/+kEXMuvhqD/2prD1E0LVEO2zlxEVQ8U/hFzBNKUF99
ZwyEQ75t1gW9xHc/eW2Ozwu9vfVK3NcSl2YtD2mfnYN8BjNYlHO/UKuBL+bMRXzKS6bSkHLt
YtWnRfA5oReIJJHJ4VKf3SVr+l6XSkeup1lhcmgD+8mXbskEIwvJs9C/ukmcb1agYK6ATiSV
oV9PUtuyxkisnHdy3Hk05wVp4zk9llWcyAmmdinXmA4B4p/i5hPtGtTAqvDBTd5eKIJEzqzK
NAIsgr5RlTjZoLhRLxVsvFszrDzaZCK/EYVlq4TUaYPWakpafrlXXOaKV8qCSEHd5RkxHix4
nltsFeQPmT7A1bqAz6X4rnRALAEi3QOaSl8iqKBDLh+6FsRPfnlVXGoSG+Vc0xpFdq6a8N7P
V7brkpLCxp8SW4CupXQ+T4ty6+gAVxteUCQmhMdkZj5idZ51fM4GNEdKpM7FYo+0SBNYLIn/
oKGlTrV/fFYv389Zs8t1LUvQDWnVUCxBwK8XuaXYTUNlT6DZUKxnnMXLJLZkbxVURnLNLvZF
vpN8v/AzmENfwm0oVB5D4wG1bToa9fVtcJ3Elhx432M9I3GjCIbzppVmHHTf0vG8Zl9gS/my
KuhxzYU4Ut2t8IQ2yu3cKrP8os3AEazDKOM34gfeuLUui4Z/VIC2+QlYfq++kWXU0ji/VO9P
p96f1Nt05caVpQigO25zUZ4NjgS1Gi0XAeRvwqt/xCgtj0AFyzgJczWsSz7BC+vw2iycf9Uc
sXdRvkJlzmtfV/2zSDM8YgH4yZ4pacRWQTmjNwuQTjO1lxok3kv52lE6D8sgB8NYNfKaCjOL
eOGvijjQnpJ/OsnQuEPMD6PYQjGTiRzg7YvIcrsbZCqYBHc2uoZKTckBPxoO/P23w+U0mQyn
n53fVHTDmOVAPRRAmLEdM0ZR5gg3sZRl14io42qNZGjpfTK0jWuiRmRoGMeKca0Yz4oZWDHW
UatXQjTM1IKZeiPrPE9/ZZ6nZIQtJhnYep+MtbcE4cs5qZxYB+W4ZKSeTuPoDYicI5YHm14d
ejCu3laDoA6kVLzl5YY0eESDxzR4SoPxfTKEoc48EIE2rrt1PClzvTkBpVMfczTPbAObok/l
WGnwQZQUcaA3LDGg1W1yylxuSfI1GJpqFa8W85DHSaK6NBvMwo8SukNePI/MgFjj44Dnwg/N
JuPVJi6oFsXLxzffv9jkd7GaYoYjNsUcMX2YkCmCV3GA8qHWgHK1zlM/ib+LSqRglyTzOgNQ
F3ureoTkPYfq8f3MT/a6BEDt1vmANtIH1umwKjCPvvHkLqXmOamrlMHH5GSgky+wfVo/TruO
pHkRhXYSQJThEsyZSBZetTjlatuMZ9ph4lyoyGPy5MJ0nDQQpD407dW7JVJ2uNQp/Bk/H2Hr
xF4OVm+k3Nmq5raUMOt0Ys052HbcopI+dNLB7heimgA/Cg2jZZRkqlOPRIvufv/ty+WPw/HL
+6U68xIkn5+rl7fq/JsxFQzY+Y6YIgHnburVYoOchhoFzALoHHQ+ZY3Uz0S1OBYvVn7CyDaL
dbp+oC+otzTQjA+ve7PDZO2HWbwi3qvGAJPC5GPTs6V58MmcXN3r+HN+RBkrQqV1vagNtkD5
znr9io7OktEs2pKHULXVYHzCTvDoFKFPps9j6e+/fexf959eTvunt8Px02X/ZwUEh6dPh+O1
+sEly6fL6/7xr0+X6uVwfP/70/X0evo4fdq/ve2Br4CfhBi6q87H6qX3vD8/VSKawhBHiwBU
4WSzgJmHRbwBqyHy25xBaQVNffQOxwMP9j38b19fnVAmMubFFAS/rVf0JJI9GKkpbxLPHvII
FSW8QVb6CW1f0M9s+XGlpUwyeoKnh4QHyHOFmCdr5B2vA5y9EU8UT2ABm6JCQkfl0bPeoO3f
tL0hp28+rU92nUt/lSJ7xZawbr54cP54u556j7xY3Onck8JJyV4kiOFNFz66r6iCXRMe+SEJ
NElnyV0gairZMeZDS5xUrgOapLnqcetgJGFrhBlDt47Et43+LstMagCaLXBlwCQFxcdfEO3W
cKRG1yjLCsMPlmHMxN4qHM5G84u5407STWIgVpuEBppDz8RfAyz+EGyxKZagpxDvoxckwlgW
p2Zji2TDz8nF5rtTbyXW+DZVpvTCvP/xcnj8/Ff10XsUy+DHef/2/IFSpNXMweh9oUaHVDWg
pssgMIcRhCb/RkEesjZZpf9+feZxko/7a/XUi45igLC2e/89XJ97/uVyejwIVLi/7o31GuB6
Gc3sWMpxNA8tQfP03X62Th4cj7xF0y7lRcwcd0KscYkwWUVg3OGIGFbzEPzDVnHJWERZwXoP
CrWtTejul9oEFWbDRoM+0U6D+pUWHBmYSjbhiIBUrQ07pb/d3eiNRd/Usk4t/yx92HW2DQfN
xK1GrnJeTP6YUQsumFNHfQ2yMIVRQEiQSC1FWcOS/J7obn2ru0wOEQN3RH9gwNznvilXV8uG
j2+gbOyjUNz+FD4vgl1s0mbSl/vLs23OZe5abdOigDvq3beSsonEri5Xs4c88FzzSQmWUUA0
kuIFDoevkMBmYH/93Y7ciuHhwumH8dyOqZs2JTjZoPVTtp+JJ+1U3XzNkgopmNlOGsPqiRL+
19QM0pCSdRysOjA7sBRzBthzTWq29B0SCJzJIo9CcalmRQ4d9+aTlmcIBgAEfXehwaeUx65B
8gO/2dpUvYpF7kxNleE+GzomVPBCKfikBCHeMLDcn0VRL3OV+REjXgagZUF5LBW8hYM4Sunc
aHm1mZHXhBvRF4tq90S7FBB09ft5TCyABmFk59fxlrfgCd6TJPatiJ89WG+kIA1/ndK1k3I/
F/0mHGeuTwHFvRsSC0gsiWIVAqUN+0cLI3OfAZhXRmFke6d5o/Xq3d4t/e8+lZy+WSt+wnxC
NDTqmBVhGwmLIlMzBtsgkwnxSLjYCO0NSpobH18hsTeTmrAiMlmyuF+Ta6CG2xinQVt6x+jS
u1czq2s06EX/USdTfuP3XVAmiZYz5ok8e9Q/ffKd9qDV6AlZMqd91nwHgC0pxe07K8wCQPn+
+HR67a3eX/+ozk12C2r8vDhEGWSUpRzms0WTRJzALLV0/Ain1TAiSCiVkiMM4NeYF42I+DWE
zPxq3O4tKfdEg6D9BS2WdTY8ZVILmtwS/KLTcSeH/a3FfsZDGE098J4QONsy88M6R7Qxxx2W
C9xbsqwjhD2d7MYvUp4ildAdO2wUkJ+6xXP9oj+4bSYDcWDL0d2RfOMBGcvJdPh/lR3Zbhy5
8Vf0mACJIXsVrTeAHvrgzDDTl/rQjPTS0BpaRdi11tABeP8+VUWyu0gWZeXBhoZVzWbzKNZd
3ws5GC/ALX46HuUc/CHi+ad34bmXXyXKHwivfycqDOBKqm7A8MJM/tlwXdcKzS1kq8GafSKw
m/LK4gxT7qMd/3X6y1woNHHoAt2SQ5/kbl8Mn9Hj6wqh2IeE8bMrGLFCDXHE3BC/karimQok
PT/cP5pAqy//vfvy+8PjPdepGK+IeQRh15qm+sC3zEfMK6rUMywGsHVUEQadMPzL1LRwzkXv
GKDrMtdN1l8b77fNxZKq4ten26e/Tp7+fH15eOTCHZYAOZ87VpDCtcy5agqgkD0z6mC0lfcB
uQZOGQs9sNVy0VPARDdFdz1veopO4qvBUSrVJKCNGudp1NzVxIE2uinhvx6mLNecK2j7kotA
xijoOfO62K5CL37sAShoJlcc9Lgr6u5Y7LbkCWn0+xwDnXU2yBjaKAftaz8LIB1wDXhNH899
jFjohMGM0+w/Fcq7KOg6I2/iFBMKHC+VX8thEh5KoqqBQcn6A5wxkQYgPNcBD1kkGFVfeih4
vTOdx5qAggmwi9S+ushnTdnWiXmwODcoysDlVXl+VtS6ckBuCDctGbn9aGVsxaCauP1MxAZm
R24Xe0EmSECnZgn/eIPN4W9fbWzbKICv8+4/C9HZubzaFp6JMZ0rcNxNdR69bwD6Go8sL/4T
tQWliZbPnLc3uhMBOQA+iZDqhpd/YoDjTQK/TbSzreloAtnK/PqAPcgp89BWrcfN81Z0YOBn
3IPBGzksL3beDwqmGykpcM09FdVxHBQSHKlt3ted2J7XYvNmYO3ZMLSFBoJ5pWBpe69yU0ZB
P7weuGlCn/LZo5bY7tXhauijTd0poPXbcRfAqM5W1pEPQugBSdW+yrKfRxBmPEpfUrbmosp6
jDvcEXstUWS0zRPy1CzuJOwCPuh2rHK/24LV3Lr77fb1jxeMOn95uH/98/X55Kuxdt4+3d2e
YM66fzOBBB4e9I2a6/wadvbFaQToVI9+TejKecqopAMPqMKjZ2USzPHWrn6MW2uxzpWHwoMK
EJJVetvUOKustjCtB8gJKXf5YVuZo+JdAt2EcS1Yj4vM0tJQumnuvX1UXvJLu2pz/xd3a3Kb
qfKjNorqBv1w1gbdX6LClfVbd9rL9lXq2vvd6pLCJYFP8U4DnBBHGK7KgZER17pVIyaCaTcl
P0abFjUVYc0+av38nRMDakLXf/hKE/y3zC98QVsJG73DkGFPilxAkwnvmzcV1h723bMipLpA
p5QAgZbtkFXcvwebStW1fHRwQoPIQHS0arYJ/mTJnRFwp74riGPAqfXb08Pjy+8m/8TXu2fB
QYQ43z2V6eQDsc1FFiYCWDhHil0G5m5bAUdbLcb0n5MYl5NW48XZspmscBH1cMbc3bBsnR1K
qapMDmoqr5sMSz4K0RN2ypLTsGh7Hv64++fLw1crITwT6hfT/hRPmokq80X7tQ3OQDkVRDeZ
a9ACHYDZlTlPhlQesn4j8xoMKx9lQXRb5hjLp7tEVIpqyCmgnlAxG8ZiukMFN6miUKALkPQ/
+3u0g+sPQ+5Fb/deZSX1n/H7cmpAKCjxmbz1KlTaCD0+WzuFmS2wbjCcm0qySLUd7Fgkxhoj
Fz0hy3Q4mEgw9OKvs6BIfQijr8QYSCmUyrg/2RBf7bv92LHTpXlAd6MuriPLi469b5stJyTb
aor14AUQWePiaGSW8+L0+0cJC4RFzUU6M2gM8VBRK8Y8XPjeYeXdr6/394amOOKA5xbYIkxK
zpk50wdCo0stALkdaL9AinPBd7SHxlfUUWvX6qFNBqitb8JgSNGPDxH6FpYzizhqBJkYq2iL
2mbhKvXhGy/6zYdRurNkz9Y3VoT1xUTHIp5Uh4EcTjdJ4e4iur8CF8vWoeva7hG4JK2/YPBO
B0m+xZyaya9FakBXddzfVU0Wb7xs31hUwOolJ4IF2m1BMt0Own1tUUyd3GhEcrMpzUS+fXzE
tpliLzWcd9X3bZ9O7mL3oyEMyLnzEKeMhAeURLKBO+YXBY2aWh2XtEJNM00xrFvoWLge2GgW
9kV7Fb0E+oJmE1Y7+2Iv4r+xHsMOcw2Flgh6/wlmuH79Zijc7vbxnhcOb4v91EEfI8wYFxGH
djMmgcgLkHjH0TqsUP0eHCTgk+K7vC+DV+EabfjaLBgmFhnPLsx53Yk4bw2YoSUHHOIsA2Zz
jm+Yd5ifaAQBQVyYwyVcZnCllWFU/JLwQl4cTmLx7XA7tm0nJsLicDvKUx9IvPw0rs0DzGAZ
BlGaRp+JojaKpvXua8I0JAU92VMsi9mV+Pa9Up1hCoxCF32jlnNx8rfnbw+P6C/1/I+Tr68v
d9/v4I+7ly8fPnz4u79NTZdb4skXQYQHal4tkd6SozdZYcYsuipQCzCN6qiiq8CVHY1okYx+
OBjIPFTtgeIPwjcdBlVHjxk7kr2j2WBBQIlpswUk59sVXK9U6mmcPjK92ZtT2lY0JDg/6Kxv
buWvDrR+pBCb8/8s7aLSIVIHtCu4LWiHRfmUiDmEyQIOFm3tsBON/vQNwrg3l+yPMYBFgWt0
kBTEBg/+WRf2aA31MMbT3SUjw+3+eotpcleaWOGeMAoQbVQzahNHYgzPxSTxiN5Srio94GKQ
zArN8tojBO9NkgMWwvLpo/eknxACm9Qlz7Xi8iN6Iw0/HiinYeR7gYX314T2KvC/aMFL2BBg
yDsg7ZVhhUbl0upJsW0SI+Hx1V0tI3HN4IjWxBTWGvjk58mQziEMtimux5Zdc2TvXg9HrJNp
KAsvgPoLn7fZTI0Rtd6Gbvus28k4TrjfBKssAOeDHneogAo5LAuuiTUGBDR7BSgYUU87DDFB
wPAKmZhO0CEhVGsVtjfTNVMa06egljDcnWYohU/jSekTVtekciqE74m3uJFw7w3wtUU8aawr
ovAHQOSKwg6kkxqEZxAMxW+N3ud0dOGLLKKgoAsTtER7YN2O0gYQDxQbtikzIwXq9JfA9m2i
kRr2IdpdB9jqUavdKnY7DNGKDg0w8Ls2XmoHWDh9f9pNtzncHLBmwDdsMO+clwnKg6l0vJVD
yBo47Rma1M2TctV6hwxb26HFSxhD7GDiFTNMWLxQ7rlqT24NLE3P8ugEg8lVevncYQ7LCKUo
wI8P/7K97DTE6xyShHVn2n0wZnArdVFwyioM1rolVOGD3PT6Bh/0W7BJycPtRWdRciTgh5qD
V4suQ/jhmNlZIqVqKvTGTIECFp8MTjiDjCygzOi2V5yEElljXaq53RX640+/nJEpBCVpSV8I
SwAXOw2D5st4oC19VftylLktfIIYIZD3evljCSUJzdc7DXjL9JT1Obo4pybKM1QuDKqjSqiN
wTkUe1gnzGhvEm8wPPb5mc8C80/cqWM51bK3lZkDY1ow4VKJ/K4Wbyg6WdNOCHvAGFvZtYoQ
jDONtKGUcUAJjB6uGTiXSs70TBjTFOaS5dAj2WDTcEz0tIHrMI3Ro5sERaKncUI3Rx+qS9kh
zmzT/Rt7+KomaeyNj0cWrGjfWpe8k40BBog+U7uWFH6ySod8hGAVVgKTWsGN7msQilS0hiYt
0Rsfkbbh2K1HYfXJ7AWE5Kns0mi1qgu43yWx1b0LBVNuI3fPCQq/xLEkfWozkyYZbhAsVhFY
CIYM699J1x3T/W1LLwki/pZowGJ7zEn9h5kE0QKSVV6kAkGFx81Tq5la0pFSImU9GMbRM/xT
AgiL4VG31oclrxEnbcf8IrpeWxmX9GETuy1V1lfWO8+773j7XOZbme55WJjw+1jmUkA+jqAb
kXwG1btXQKR48Qo4l+0EZCMyZQRyI+a3QptyajMsvISka8L6jHRZnx4/y7mFGIaSvJIXuDmG
Yuch1+nLvWSNdR42TNZN5wM0DwaSk1U21FowpeCMW6ta5zEB3YQh9ngPJl82NQeN+cnntve0
2Eu7MWkSl5XIBxxY0f8HtP+8eIAjAgA=

--c5bbscuw72clrk7l--
