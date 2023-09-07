Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30730797C7E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Sep 2023 21:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236182AbjIGTEB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Sep 2023 15:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbjIGTEA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Sep 2023 15:04:00 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF089D
        for <linux-gpio@vger.kernel.org>; Thu,  7 Sep 2023 12:03:56 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso14534355e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Sep 2023 12:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694113435; x=1694718235; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lh5w3MxPE+alnGfs9hmhKOYGJqh9e2xBJbpyNGgCkrU=;
        b=l/8Fo9+DClwvCTFbNSx+9nK56/ANqf6eumjg9we2PpPfGLReOW1dJXiFBpX+4ZBuKn
         6yWy5MU6/UVpVFdUEHkytbrwpKAS2+V1ZkodzhcnAwPHfhsq+6Y7luexSoUD+ilhihEh
         8hGUyrOTD3aLhGJcI/qOSd809NFS7Hph+IQ98S+aFysHtlH2QlH5p9H9yI3l8RMLdT1l
         6JwlrGLlgwf1VpwsCLUTbgRp2zFwIPxoOHWycwtsBBGKnMUVJzl1kmtGwbcLfYo8KC8K
         lFsLvIEndFtvGCcWKGuQBQmOGQ2/Uz2eX3vNlc0prwWkfn7U3YgvkSiVgEnO707wwowR
         IVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694113435; x=1694718235;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lh5w3MxPE+alnGfs9hmhKOYGJqh9e2xBJbpyNGgCkrU=;
        b=DuYsTJnWDLuHIElTnAI7kgFRlw8/chjguJMnnfswghmNlQ2UHqK5vn6JPoau0fHLoC
         oBNxObYHPezXDAFtARHVOPEE0/pECHtmQdx4kGuTBUKjuaMCutXU3At2w377GQK2SxPc
         3J8prMcU3YkWc7n/0cBVJLjxawkyrv5H38zVCh3ho7j/pXI7tY+K1nN04X5zRGC7hVVb
         mkmAnTUAwIq9vaxKGycCjkQ1EspmMduKfurLKpXj7pQkRqnkoBp3sV1KFYo5puZhJ4yd
         GtBi4kA1bcXFE9a6/YsTnIqE7rVwDZXo0rswqzwTBHWmlxaSXUMIf5hYdFvajYS5g4v4
         Eeeg==
X-Gm-Message-State: AOJu0Yztp2uNYlZd97+YdfGk6uWTt+QM/E82TmuG2r032BLFDf+S3VQm
        o7kNmmEO0lnL5hTlBuH+oCcexy7xd9UIRXjkh5o=
X-Google-Smtp-Source: AGHT+IFNy6bkfFeC1oZYCCYNRcSXW9KT4JmTkjuxMK/5wZaA3rwvDo41I+2JUgUCunyAW/aj5xGAZQ==
X-Received: by 2002:a7b:ce8a:0:b0:401:b0f2:88b4 with SMTP id q10-20020a7bce8a000000b00401b0f288b4mr4060288wmj.26.1694080438540;
        Thu, 07 Sep 2023 02:53:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c020300b003fc04d13242sm2027176wmi.0.2023.09.07.02.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:53:58 -0700 (PDT)
Date:   Thu, 7 Sep 2023 12:53:54 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     raag.jadav@intel.com
Cc:     linux-gpio@vger.kernel.org
Subject: [bug report] pinctrl: baytrail: consolidate common mask operation
Message-ID: <d164d471-5432-4c3c-afdb-33dc8f53d043@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Raag Jadav,

The patch 4cfff5b7af8b: "pinctrl: baytrail: consolidate common mask
operation" from Aug 8, 2023 (linux-next), leads to the following
Smatch static checker warning:

	drivers/pinctrl/intel/pinctrl-baytrail.c:1023 byt_pin_config_set()
	error: uninitialized symbol 'db_pulse'.

drivers/pinctrl/intel/pinctrl-baytrail.c
    918 static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
    919                               unsigned int offset,
    920                               unsigned long *configs,
    921                               unsigned int num_configs)
    922 {
    923         struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctl_dev);
    924         unsigned int param, arg;
    925         void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
    926         void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
    927         void __iomem *db_reg = byt_gpio_reg(vg, offset, BYT_DEBOUNCE_REG);
    928         u32 conf, val, db_pulse, debounce;
    929         unsigned long flags;
    930         int i, ret = 0;
    931 
    932         raw_spin_lock_irqsave(&byt_lock, flags);
    933 
    934         conf = readl(conf_reg);
    935         val = readl(val_reg);
    936 
    937         for (i = 0; i < num_configs; i++) {
    938                 param = pinconf_to_config_param(configs[i]);
    939                 arg = pinconf_to_config_argument(configs[i]);
    940 
    941                 switch (param) {
    942                 case PIN_CONFIG_BIAS_DISABLE:
    943                         conf &= ~BYT_PULL_ASSIGN_MASK;
    944                         break;
    945                 case PIN_CONFIG_BIAS_PULL_DOWN:
    946                         /* Set default strength value in case none is given */
    947                         if (arg == 1)
    948                                 arg = 2000;
    949 
    950                         /*
    951                          * Pull assignment is only applicable in input mode. If
    952                          * chip is not in input mode, set it and warn about it.
    953                          */
    954                         if (val & BYT_INPUT_EN) {
    955                                 val &= ~BYT_INPUT_EN;
    956                                 writel(val, val_reg);
    957                                 dev_warn(vg->dev, "Pin %i: forcibly set to input mode\n", offset);
    958                         }
    959 
    960                         conf &= ~BYT_PULL_ASSIGN_MASK;
    961                         conf |= BYT_PULL_ASSIGN_DOWN;
    962                         ret = byt_set_pull_strength(&conf, arg);
    963 
    964                         break;
    965                 case PIN_CONFIG_BIAS_PULL_UP:
    966                         /* Set default strength value in case none is given */
    967                         if (arg == 1)
    968                                 arg = 2000;
    969 
    970                         /*
    971                          * Pull assignment is only applicable in input mode. If
    972                          * chip is not in input mode, set it and warn about it.
    973                          */
    974                         if (val & BYT_INPUT_EN) {
    975                                 val &= ~BYT_INPUT_EN;
    976                                 writel(val, val_reg);
    977                                 dev_warn(vg->dev, "Pin %i: forcibly set to input mode\n", offset);
    978                         }
    979 
    980                         conf &= ~BYT_PULL_ASSIGN_MASK;
    981                         conf |= BYT_PULL_ASSIGN_UP;
    982                         ret = byt_set_pull_strength(&conf, arg);
    983 
    984                         break;
    985                 case PIN_CONFIG_INPUT_DEBOUNCE:
    986                         if (arg)
    987                                 conf |= BYT_DEBOUNCE_EN;
    988                         else
    989                                 conf &= ~BYT_DEBOUNCE_EN;
    990 
    991                         switch (arg) {
    992                         case 375:
    993                                 db_pulse = BYT_DEBOUNCE_PULSE_375US;
    994                                 break;
    995                         case 750:
    996                                 db_pulse = BYT_DEBOUNCE_PULSE_750US;
    997                                 break;
    998                         case 1500:
    999                                 db_pulse = BYT_DEBOUNCE_PULSE_1500US;
    1000                                 break;
    1001                         case 3000:
    1002                                 db_pulse = BYT_DEBOUNCE_PULSE_3MS;
    1003                                 break;
    1004                         case 6000:
    1005                                 db_pulse = BYT_DEBOUNCE_PULSE_6MS;
    1006                                 break;
    1007                         case 12000:
    1008                                 db_pulse = BYT_DEBOUNCE_PULSE_12MS;
    1009                                 break;
    1010                         case 24000:
    1011                                 db_pulse = BYT_DEBOUNCE_PULSE_24MS;
    1012                                 break;
    1013                         default:
    1014                                 if (arg)
    1015                                         ret = -EINVAL;

db_pulse is uninitialized if arg is zero.

    1016                                 break;
    1017                         }
    1018 
    1019                         if (ret)
    1020                                 break;
    1021 
    1022                         debounce = readl(db_reg);
--> 1023                         debounce = (debounce & ~BYT_DEBOUNCE_PULSE_MASK) | db_pulse;
    1024                         writel(debounce, db_reg);
    1025 
    1026                         break;
    1027                 default:
    1028                         ret = -ENOTSUPP;
    1029                 }
    1030 
    1031                 if (ret)
    1032                         break;
    1033         }
    1034 
    1035         if (!ret)
    1036                 writel(conf, conf_reg);
    1037 
    1038         raw_spin_unlock_irqrestore(&byt_lock, flags);
    1039 
    1040         return ret;
    1041 }

regards,
dan carpenter
