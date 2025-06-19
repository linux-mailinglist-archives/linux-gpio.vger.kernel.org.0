Return-Path: <linux-gpio+bounces-21884-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 202EFAE0921
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 16:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 170215A5CB2
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 14:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F8F21C9E1;
	Thu, 19 Jun 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+eTYu+1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F23422126C
	for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344515; cv=none; b=d+cSXa+I36nPoD9GumalI+sDUSYBqNOtC1HVuwo1BjBKNKNLjKO5SN6igpifqWOJvgoPMEklfmoV+7anNfZqsmo/Dcqne1xj4oTW9uKB3cbdPpdcCYrxoi6DHNcufppm9ii1uA80wQMAWErgKF3t2DFgq0OTSCLbxNF8eXtzzUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344515; c=relaxed/simple;
	bh=XQbO+MeU7LphEXYmi3GPh+fSnb0aMig4WX9RiVNilV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M9speLB67VjlPgUUdpnOay35iICM9pKLDy64KNEYA1gyaon3S4MvobMRpg/+jj/AgSWLEjF9FgJ+SL9iws/xZZnXtUXJpIAD9MN0DzBSP1iWr9b8mtBtUPWr47pA2gmQZ+zPrhFIUiZwKJV4eM2NUDFCO6ExWiOtM2imDkAfpjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+eTYu+1; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73a45bb28f1so452521a34.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jun 2025 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750344513; x=1750949313; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uve89EMzkitmRjOaJNdbWQJ/RDIXjqQq2KcXNC17HOs=;
        b=V+eTYu+1ahtFEjU64PoY3holXoxMfQNGYTBSLbK1vLLeRaI6txdw4YzuNHsQOFi2gR
         OQf0R5e7xrvZPbHrS8DhGfM7QWWUcEIj4R7alMr9CFEzy1fSfHTncyiad5VFA8WBQfk/
         2HeiNwwhB2P7/+z918UDG5dWPH57TqqijtkFvb4c+iDSuPpCrAxKLol5PWox6lUjJEZ1
         SaEbCnIjl6/pMJ+bdfMcfWjEBSJijjKkKjIZTV59RwC8oDiWGrCO0og00Vuo0ahmz1b9
         1W98AUpPlR3nu3umIjqurEt2qMS+A9o/HjRNv2kV3kfnKT+47goBlc3atwyavF+FZQxW
         nDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344513; x=1750949313;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uve89EMzkitmRjOaJNdbWQJ/RDIXjqQq2KcXNC17HOs=;
        b=mlFBvqfVsf8ptbPqgy/BbgW8nX+6u7F/t9flGeN9rYV7k+xiINAIewZVbh+MHdQ+FF
         QO8MqYR6uQfpZsWuNztIlJJBL7B7EK3pZUIyf71tyxrTY7J77e9ofVamz1oBeY7T3ZS1
         nDvSo3PIJHdjHM9MSp//H2XIWqTtCy2K3Wco2OK2j5TVyzJKy9UCZZbeRxWqWRuu/Uco
         dafOaPm5I26ZGynBIgAGU3QPdallEaEOJuw1DVAGSyArAWNcEhnaZAobUCPCm2ClRVUR
         9rQRJHhKxCuZoNqE5trSBDp24RSDrIg4wZ7DcPVuR0NqMAQnN5R9PpEJs+2kdov/5lPu
         CJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCXR92cpZZwgeH2Dqg+YL66zj5KpHZx3aCIkKZnBtRLC6+UFq9mDkjl46cfXPguibVZQKXF66TT589Xi@vger.kernel.org
X-Gm-Message-State: AOJu0YxYI4e1ytFJkLd40rT2eOpy5pTYrRg3NhmRE7270GnKzfSZe29G
	8VrRU6tIyjpy8560046n4USQ2XD8Mw8wDsOqyDh00Dc/XvqEnsuQ970d0oFw4YG//a4=
X-Gm-Gg: ASbGncuvnUVbncozWfjAD9HJhOoY8MQxZ3e5vD71HBwBUWVCSFqD616zGhtpA2nU27r
	fWNfZmZ9fDGOMzHZKtDkbZRGKuyaQG8A9awH+cmR2DJ5DUr3Xw7Tj3JJ3p7VjxwuCDW28k7opf9
	+9t80sFfwI129U2scceL7ZXYv4pRzK20UoG3J1CiTZCHLxg/Ew8dzevqU5kNOegwxwRqFmZDf0v
	Nyg4wZEgMUab7vpSVB01qTVbzcZKVMoJQiUSGGSwKsATx147iMITRU9jkOTLIfLysQ6PQ/MNsD4
	ilNlR4lmBR1Xa4cOewLxhTc4Cns2X+S9G0wYo5tI9Db2/CvfY9E6ewaPZlUrYh46tPXByw==
X-Google-Smtp-Source: AGHT+IFQB8JILX7sEXumld5e4Y3/ldgg/AQr8eFGAOqhptgecy59aQAmbClEqPPBViAJFk+qgfNH2w==
X-Received: by 2002:a05:6870:8894:b0:2d5:97d0:c03c with SMTP id 586e51a60fabf-2eb9ecd771bmr2508756fac.18.1750344513157;
        Thu, 19 Jun 2025 07:48:33 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ebb30b0653sm139118fac.8.2025.06.19.07.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:48:31 -0700 (PDT)
Date: Thu, 19 Jun 2025 17:48:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 42/53] drivers/pinctrl/pinctrl-aw9523.c:658
 aw9523_gpio_set_multiple() warn: inconsistent returns '&awi->i2c_lock'.
Message-ID: <4efce873-0542-4dff-9a77-fca9d582f1aa@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   62be3d6e481122f02364993fee8322a681072918
commit: dffe286e2428a32bf5a70648d22a678b83080414 [42/53] pinctrl: aw9523: use new GPIO line value setter callbacks
config: x86_64-randconfig-161-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191952.A03cvn22-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506191952.A03cvn22-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/pinctrl-aw9523.c:658 aw9523_gpio_set_multiple() warn: inconsistent returns '&awi->i2c_lock'.

vim +658 drivers/pinctrl/pinctrl-aw9523.c

dffe286e2428a3 Bartosz Golaszewski        2025-06-12  628  static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
576623d706613f AngeloGioacchino Del Regno 2024-03-01  629  				    unsigned long *mask,
576623d706613f AngeloGioacchino Del Regno 2024-03-01  630  				    unsigned long *bits)
576623d706613f AngeloGioacchino Del Regno 2024-03-01  631  {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  632  	struct aw9523 *awi = gpiochip_get_data(chip);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  633  	u8 mask_lo, mask_hi, bits_lo, bits_hi;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  634  	unsigned int reg;
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  635  	int ret = 0;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  636  
4210ef801a2482 Andy Shevchenko            2024-03-29  637  	mask_lo = *mask;
4210ef801a2482 Andy Shevchenko            2024-03-29  638  	mask_hi = *mask >> 8;
4210ef801a2482 Andy Shevchenko            2024-03-29  639  	bits_lo = *bits;
4210ef801a2482 Andy Shevchenko            2024-03-29  640  	bits_hi = *bits >> 8;
4210ef801a2482 Andy Shevchenko            2024-03-29  641  
576623d706613f AngeloGioacchino Del Regno 2024-03-01  642  	mutex_lock(&awi->i2c_lock);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  643  	if (mask_hi) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  644  		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  645  		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
091655b9285d83 Andy Shevchenko            2024-03-29  646  		if (ret)
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  647  			goto out;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  648  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  649  	if (mask_lo) {
576623d706613f AngeloGioacchino Del Regno 2024-03-01  650  		reg = AW9523_REG_OUT_STATE(0);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  651  		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
576623d706613f AngeloGioacchino Del Regno 2024-03-01  652  		if (ret)
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  653  			goto out;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  654  	}
576623d706613f AngeloGioacchino Del Regno 2024-03-01  655  	mutex_unlock(&awi->i2c_lock);

This unlock should be after the out: label.

dffe286e2428a3 Bartosz Golaszewski        2025-06-12  656  
dffe286e2428a3 Bartosz Golaszewski        2025-06-12  657  out:
dffe286e2428a3 Bartosz Golaszewski        2025-06-12 @658  	return ret;
576623d706613f AngeloGioacchino Del Regno 2024-03-01  659  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


