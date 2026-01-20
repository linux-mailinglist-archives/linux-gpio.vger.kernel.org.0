Return-Path: <linux-gpio+bounces-30760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F566D3BF29
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 07:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8D7E1383616
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 06:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD09236BCED;
	Tue, 20 Jan 2026 06:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOzcGuBn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EBA36CE16
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 06:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890309; cv=none; b=ogBWR2XzwJFGmKvThIjUydMuWWT71NXEpIZOEM+SVrGw4TZwtYux79AO8Br27+EYEXsb+9iEq5cnkh7SFYnCy7WXPkB18ok+77bBB7bIHcJm9tB7YOts2aGXnDDCYksshuSME5fOiKyCVWstKcKwcj92q/91vOQ8zluRm7FdfXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890309; c=relaxed/simple;
	bh=vhLKRi5cwQRdkwKwCl3rxCtEDizeC7M0JtR/7FgZE1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=liXTyk6iL5Sah9XuNRyXCv3T+sbD4nM9+7tYbTxcL3ySog5HXlO0OBuR1nhsNrUvDC+qTGQxYFZR+v/Ixq/3O2PDqggGV2yMNW2u/Rhz0RyXrc4kceOFB/INzcL7G5hmQa7lfCt36XuQRXuKFqP+KFmXmKiv3KT/mXwjoo/luSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOzcGuBn; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-4358fb60802so123191f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 22:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768890303; x=1769495103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZW+7SXYCzs528iRaVu7Ui49r+v4hhw8vma3yqlv8fRA=;
        b=xOzcGuBnzNRBqgo6kbzDb0xoWNMHfSErMSjNx+Ke8+dUMi8zXgY9EjRigMCFhws/ZV
         hU766pe0geUptFVSgTY6bjpwc7dM+0EeSOlFn/e2Pq+2Izsdz7tN7of2H+z8ibOWGscu
         EVVgXCKjB343wouovLOrrd10Y/A6nHcZq24veC4hxQ/jlU2nf35OEMnXS/BAoATcnrNa
         oAIrQOeT/OBuakiXRbk1LQlQgP8BcABRGiFUgnjEVyWBE/AfpgwVXySbki8NUBjHA4Wt
         KLxfy0v0bEe18XATHVW8iJnMaGj14biXO+CpK55i4E0FNyl8IVl2edAVFJOlwqqWHvoG
         Dt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890303; x=1769495103;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZW+7SXYCzs528iRaVu7Ui49r+v4hhw8vma3yqlv8fRA=;
        b=YWGFzANOjSSmtAKHgZDkNuEmWj/o5s7EeEzRAq9Fo35XS3dPwOeCAovuB7paxLwuBE
         guHUjBE8YpJ/YJEHU7OzINHmJx+JuJUv2jObzmCX0EQkzDbn90j7Xfmtr4bHi5PCM74C
         Xt6kbJVXwU3tnPpu3iAOlZ14DN+zE/UHYaqBdLrzDHkrrxCsY2K7NIoZ0ecu6ScWI4bC
         pC+q8vK5NlFE/HKz+jKSQkJrjdEsPLD+8SSuiox9Xo8F6c/ghinNX8Ogif4noyNEs5N+
         qc70QJfxpmK3n2Se9cmiAy22UGbdMBCSIb9XjRhM7cDZQzxcvaOz1jGcpdmJVpXJKKKI
         SFOg==
X-Forwarded-Encrypted: i=1; AJvYcCWCuoPetIbQR0GTv8hsNfalsW9yxmUAt6bJV1FN8rNNqgD+CH1QHHVm3L1IIYM0f2SXs7pEN0n9Uyjm@vger.kernel.org
X-Gm-Message-State: AOJu0YxaK/EQH51bwhXDOPUzxdYvJXkPyanfE1KWWZ3dTaE74qBwia0/
	zLZ8c7KgrmWg953Imy2u7Ynq6MvScGxA3dI/Zxm4wJnQR0rOR5CtqlfrfqopdKsCtPs=
X-Gm-Gg: AZuq6aK/kCeI9xCsQwo4XozlzydlmVmbDB6fk9QIDrEoapzUYiu0YPFrXUuu/zxVdnK
	ujx1tM5Kop7qxsTaLhrWDmQnz6WxwZkamfpxSkcHBAgRNJCe+ROO14GULsq0QGaepMMjQy/7Hdo
	OnJxbBNN3gF3R1AIElbhFxjQbPErIol0KhgSdNuROWXMIxnjOr2hIpusWq2kjs2L4sWh9pDRrt9
	xMgfqrFRedCaB5E3sikZY7URxYv+lRMY4sbUWJ1jxw/vfdGosCLhM9muG6a4gsyCeLJ2GKTHAGB
	yKe7ksmgESVMH4rHLST3VNH/8G03bqLsqAibt3zsMwlpNtuCQ/re8vAAzqU3aYA5LvC/gxU2sAM
	LCanbhpsq5BXJG+whbP7v5qJ5NL7WqkPOfos+hk+0YjzZosO/CmyJSqinCQ57piy8EGtyzACUgu
	iznhfxPAgvEVfON+F5
X-Received: by 2002:a05:6000:240d:b0:435:932e:f924 with SMTP id ffacd0b85a97d-435932efc3dmr341035f8f.2.1768890303154;
        Mon, 19 Jan 2026 22:25:03 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm25011206f8f.30.2026.01.19.22.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:25:02 -0800 (PST)
Date: Tue, 20 Jan 2026 09:25:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linusw-pinctrl:devel 30/31] drivers/pinctrl/pinctrl-rockchip.c:3683
 rockchip_pinconf_set() error: we previously assumed 'gpio->direction_output'
 could be null (see line 3644)
Message-ID: <202601200057.P0Lr7NDg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   76d415763bae9488dd2b923b1348ce6f26c1f0ae
commit: e2c58cbe3aff49fe201e81ee5f651294e313ec74 [30/31] pinctrl: rockchip: Simplify locking with scoped_guard()
config: sh-randconfig-r073-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200057.P0Lr7NDg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601200057.P0Lr7NDg-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-rockchip.c:3683 rockchip_pinconf_set() error: we previously assumed 'gpio->direction_output' could be null (see line 3644)

vim +3683 drivers/pinctrl/pinctrl-rockchip.c

d3e5116119bd02e Heiko Stübner       2013-06-10  3622  static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
03b054e9696c3cb Sherman Yin         2013-08-27  3623  				unsigned long *configs, unsigned num_configs)
d3e5116119bd02e Heiko Stübner       2013-06-10  3624  {
d3e5116119bd02e Heiko Stübner       2013-06-10  3625  	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
d3e5116119bd02e Heiko Stübner       2013-06-10  3626  	struct rockchip_pin_bank *bank = pin_to_bank(info, pin);
9ce9a02039de72e Jianqun Xu          2021-08-16  3627  	struct gpio_chip *gpio = &bank->gpio_chip;
03b054e9696c3cb Sherman Yin         2013-08-27  3628  	enum pin_config_param param;
58957d2edfa19e9 Mika Westerberg     2017-01-23  3629  	u32 arg;
03b054e9696c3cb Sherman Yin         2013-08-27  3630  	int i;
03b054e9696c3cb Sherman Yin         2013-08-27  3631  	int rc;
03b054e9696c3cb Sherman Yin         2013-08-27  3632  
03b054e9696c3cb Sherman Yin         2013-08-27  3633  	for (i = 0; i < num_configs; i++) {
03b054e9696c3cb Sherman Yin         2013-08-27  3634  		param = pinconf_to_config_param(configs[i]);
03b054e9696c3cb Sherman Yin         2013-08-27  3635  		arg = pinconf_to_config_argument(configs[i]);
d3e5116119bd02e Heiko Stübner       2013-06-10  3636  
203a83112e097a5 Linus Walleij       2025-09-05  3637  		if (param == PIN_CONFIG_LEVEL || param == PIN_CONFIG_INPUT_ENABLE) {
8ce5ef645468502 Caleb Connolly      2022-03-28  3638  			/*
8ce5ef645468502 Caleb Connolly      2022-03-28  3639  			 * Check for gpio driver not being probed yet.
8ce5ef645468502 Caleb Connolly      2022-03-28  3640  			 * The lock makes sure that either gpio-probe has completed
8ce5ef645468502 Caleb Connolly      2022-03-28  3641  			 * or the gpio driver hasn't probed yet.
8ce5ef645468502 Caleb Connolly      2022-03-28  3642  			 */
e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3643  			scoped_guard(mutex, &bank->deferred_lock) {
8ce5ef645468502 Caleb Connolly      2022-03-28 @3644  				if (!gpio || !gpio->direction_output) {
                                                                                              ^^^^^^^^^^^^^^^^^^^^^^
Is this check necessary?

e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3645  					rc = rockchip_pinconf_defer_pin(bank,
e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3646  									pin - bank->pin_base,
e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3647  									param, arg);
8ce5ef645468502 Caleb Connolly      2022-03-28  3648  					if (rc)
8ce5ef645468502 Caleb Connolly      2022-03-28  3649  						return rc;
8ce5ef645468502 Caleb Connolly      2022-03-28  3650  					break;
8ce5ef645468502 Caleb Connolly      2022-03-28  3651  				}
e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3652  			}
8ce5ef645468502 Caleb Connolly      2022-03-28  3653  		}
8ce5ef645468502 Caleb Connolly      2022-03-28  3654  
d3e5116119bd02e Heiko Stübner       2013-06-10  3655  		switch (param) {
d3e5116119bd02e Heiko Stübner       2013-06-10  3656  		case PIN_CONFIG_BIAS_DISABLE:
03b054e9696c3cb Sherman Yin         2013-08-27  3657  			rc =  rockchip_set_pull(bank, pin - bank->pin_base,
03b054e9696c3cb Sherman Yin         2013-08-27  3658  				param);
03b054e9696c3cb Sherman Yin         2013-08-27  3659  			if (rc)
03b054e9696c3cb Sherman Yin         2013-08-27  3660  				return rc;
44b6d93043ab677 Heiko Stübner       2013-06-16  3661  			break;
d3e5116119bd02e Heiko Stübner       2013-06-10  3662  		case PIN_CONFIG_BIAS_PULL_UP:
d3e5116119bd02e Heiko Stübner       2013-06-10  3663  		case PIN_CONFIG_BIAS_PULL_DOWN:
d3e5116119bd02e Heiko Stübner       2013-06-10  3664  		case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
6ca5274d1d1258b Heiko Stübner       2013-10-16  3665  		case PIN_CONFIG_BIAS_BUS_HOLD:
44b6d93043ab677 Heiko Stübner       2013-06-16  3666  			if (!rockchip_pinconf_pull_valid(info->ctrl, param))
44b6d93043ab677 Heiko Stübner       2013-06-16  3667  				return -ENOTSUPP;
44b6d93043ab677 Heiko Stübner       2013-06-16  3668  
44b6d93043ab677 Heiko Stübner       2013-06-16  3669  			if (!arg)
44b6d93043ab677 Heiko Stübner       2013-06-16  3670  				return -EINVAL;
44b6d93043ab677 Heiko Stübner       2013-06-16  3671  
03b054e9696c3cb Sherman Yin         2013-08-27  3672  			rc = rockchip_set_pull(bank, pin - bank->pin_base,
03b054e9696c3cb Sherman Yin         2013-08-27  3673  				param);
03b054e9696c3cb Sherman Yin         2013-08-27  3674  			if (rc)
03b054e9696c3cb Sherman Yin         2013-08-27  3675  				return rc;
d3e5116119bd02e Heiko Stübner       2013-06-10  3676  			break;
203a83112e097a5 Linus Walleij       2025-09-05  3677  		case PIN_CONFIG_LEVEL:
9ce9a02039de72e Jianqun Xu          2021-08-16  3678  			rc = rockchip_set_mux(bank, pin - bank->pin_base,
9ce9a02039de72e Jianqun Xu          2021-08-16  3679  					      RK_FUNC_GPIO);
9ce9a02039de72e Jianqun Xu          2021-08-16  3680  			if (rc != RK_FUNC_GPIO)
9ce9a02039de72e Jianqun Xu          2021-08-16  3681  				return -EINVAL;
9ce9a02039de72e Jianqun Xu          2021-08-16  3682  
9ce9a02039de72e Jianqun Xu          2021-08-16 @3683  			rc = gpio->direction_output(gpio, pin - bank->pin_base,
                                                                             ^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference.  This is old code so it's presumably okay.  I
think this warning is triggering now because of changes in Smatch.

9ce9a02039de72e Jianqun Xu          2021-08-16  3684  						    arg);
a076e2ed3fd26f8 Heiko Stübner       2014-04-23  3685  			if (rc)
a076e2ed3fd26f8 Heiko Stübner       2014-04-23  3686  				return rc;
a076e2ed3fd26f8 Heiko Stübner       2014-04-23  3687  			break;
42d90a1e5caf731 Caleb Connolly      2022-03-28  3688  		case PIN_CONFIG_INPUT_ENABLE:
42d90a1e5caf731 Caleb Connolly      2022-03-28  3689  			rc = rockchip_set_mux(bank, pin - bank->pin_base,
42d90a1e5caf731 Caleb Connolly      2022-03-28  3690  					      RK_FUNC_GPIO);
42d90a1e5caf731 Caleb Connolly      2022-03-28  3691  			if (rc != RK_FUNC_GPIO)
42d90a1e5caf731 Caleb Connolly      2022-03-28  3692  				return -EINVAL;
42d90a1e5caf731 Caleb Connolly      2022-03-28  3693  
42d90a1e5caf731 Caleb Connolly      2022-03-28  3694  			rc = gpio->direction_input(gpio, pin - bank->pin_base);
42d90a1e5caf731 Caleb Connolly      2022-03-28  3695  			if (rc)
42d90a1e5caf731 Caleb Connolly      2022-03-28  3696  				return rc;
42d90a1e5caf731 Caleb Connolly      2022-03-28  3697  			break;
b547c8007e83a47 Heiko Stübner       2014-07-20  3698  		case PIN_CONFIG_DRIVE_STRENGTH:
b547c8007e83a47 Heiko Stübner       2014-07-20  3699  			/* rk3288 is the first with per-pin drive-strength */
ef17f69f5bf57de Heiko Stübner       2015-06-12  3700  			if (!info->ctrl->drv_calc_reg)
b547c8007e83a47 Heiko Stübner       2014-07-20  3701  				return -ENOTSUPP;
b547c8007e83a47 Heiko Stübner       2014-07-20  3702  
ef17f69f5bf57de Heiko Stübner       2015-06-12  3703  			rc = rockchip_set_drive_perpin(bank,
ef17f69f5bf57de Heiko Stübner       2015-06-12  3704  						pin - bank->pin_base, arg);
b547c8007e83a47 Heiko Stübner       2014-07-20  3705  			if (rc < 0)
b547c8007e83a47 Heiko Stübner       2014-07-20  3706  				return rc;
b547c8007e83a47 Heiko Stübner       2014-07-20  3707  			break;
e3b357d7dfe6b38 david.wu            2017-03-02  3708  		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
e3b357d7dfe6b38 david.wu            2017-03-02  3709  			if (!info->ctrl->schmitt_calc_reg)
e3b357d7dfe6b38 david.wu            2017-03-02  3710  				return -ENOTSUPP;
e3b357d7dfe6b38 david.wu            2017-03-02  3711  
e3b357d7dfe6b38 david.wu            2017-03-02  3712  			rc = rockchip_set_schmitt(bank,
e3b357d7dfe6b38 david.wu            2017-03-02  3713  						  pin - bank->pin_base, arg);
e3b357d7dfe6b38 david.wu            2017-03-02  3714  			if (rc < 0)
e3b357d7dfe6b38 david.wu            2017-03-02  3715  				return rc;
e3b357d7dfe6b38 david.wu            2017-03-02  3716  			break;
d3e5116119bd02e Heiko Stübner       2013-06-10  3717  		default:
d3e5116119bd02e Heiko Stübner       2013-06-10  3718  			return -ENOTSUPP;
d3e5116119bd02e Heiko Stübner       2013-06-10  3719  			break;
d3e5116119bd02e Heiko Stübner       2013-06-10  3720  		}
03b054e9696c3cb Sherman Yin         2013-08-27  3721  	} /* for each config */
d3e5116119bd02e Heiko Stübner       2013-06-10  3722  
d3e5116119bd02e Heiko Stübner       2013-06-10  3723  	return 0;
d3e5116119bd02e Heiko Stübner       2013-06-10  3724  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


