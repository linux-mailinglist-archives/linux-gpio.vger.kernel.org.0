Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 820BA70B6F2
	for <lists+linux-gpio@lfdr.de>; Mon, 22 May 2023 09:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjEVHsJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 03:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbjEVHrs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 03:47:48 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4EC19AC
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:46:21 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f42769a0c1so57721655e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684741547; x=1687333547;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MX8ast6j7Fm9DsaRcJ3iBSldYBFGeIqsRsTWL/AQJQg=;
        b=a0IJe3+zF5+Nrgrq7puuP4IUXE4g2rCM2QyUzM4qYnkY34e4OGk1aibl312ewxs2fW
         S2RJcqTAvhresjAWNwasmImUP2l9A9yNFEEaNa44him5vF36dqkU3fo7/1FNhRbkprB6
         HZkdPjtiS9v715Tcmixj3qXim+KweeQIGiFGPfZSYvyoQEVTANbhSWFZbDWkUtZ8aTme
         a8F410qK5PEr40JEpEf0MNwVOvguzPfy1wgLl+DguB/SE3CrD+xTNTAFwDN97fnleJrF
         bYEDuAqp5JMngeT3hvDDri/Q39KuodLpi2csWUspUmCvJC/sqbd3WMMHDkoLJIMLZQZX
         pMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684741547; x=1687333547;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MX8ast6j7Fm9DsaRcJ3iBSldYBFGeIqsRsTWL/AQJQg=;
        b=g36KMgq2rt1Iaa9/6x8+jjYNP85N67vz4BnVaHuV20UjIaG9Yfl1+NKNc7KMDn2au0
         o7k3DM5cqbFL0O+RZmc0sTpLIx6vShbkrz6S6Ec60iSHmfCxE9iRi0YqTOff9OSrbh6j
         GuSuRjHnfVLuf6P7gJrzQ4hiefnRvV3zO4q6wjbwGKanq5CclECof2h71fLx9oKI65dc
         Ius/o4+auXVMvqbsiZPtv/7gChFPeQhQEJmonEqPE6dgM7+udzfMGuKqdcmN5onEWfuY
         6F0sZmqxK+Ej1eE7FwLjcL86ehbRZ3maKIhQMi7VYDKZOATnBn+nAhj43ekGFUV66Wt4
         jk/Q==
X-Gm-Message-State: AC+VfDwMq+g9pdAkEUxJCmbm4hADJm4Cs8ke3A1UxizGeNIPGoiABZWf
        cM1rVhz8Ner7SlnvdoFPRnWOqHELWGhbrYDvJHQ=
X-Google-Smtp-Source: ACHHUZ5XYefWSpzwTQTJTKEXDrvIC3+mF9UcSe0SlM+de1BksogbxXeV0Y4OERjKbIuSTJWvbMpO/g==
X-Received: by 2002:a1c:7918:0:b0:3f6:766:f76f with SMTP id l24-20020a1c7918000000b003f60766f76fmr441262wme.36.1684741547175;
        Mon, 22 May 2023 00:45:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m13-20020adfe94d000000b002fda1b12a0bsm6892390wrn.2.2023.05.22.00.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:45:45 -0700 (PDT)
Date:   Mon, 22 May 2023 10:45:42 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     plagnioj@jcrosoft.com
Subject: [bug report] ARM: at91: add pinctrl support
Message-ID: <fa50d8cf-b057-490d-8822-ca1bd7578506@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is from an unpublished or under development Smatch check.

The patch 6732ae5cb47c: "ARM: at91: add pinctrl support" from Jul 12,
2012, leads to the following Smatch static checker warning:

	drivers/pinctrl/pinctrl-at91.c:1277 at91_pinctrl_parse_functions()
	warn: plus plus leak 'grp_index'

drivers/pinctrl/pinctrl-at91.c
    1245 static int at91_pinctrl_parse_functions(struct device_node *np,
    1246                                         struct at91_pinctrl *info, u32 index)
    1247 {
    1248         struct device_node *child;
    1249         struct at91_pmx_func *func;
    1250         struct at91_pin_group *grp;
    1251         int ret;
    1252         static u32 grp_index;
                 ^^^^^^^^^^^^^^^^^^^^
This is a static variable.

    1253         u32 i = 0;
    1254 
    1255         dev_dbg(info->dev, "parse function(%d): %pOFn\n", index, np);
    1256 
    1257         func = &info->functions[index];
    1258 
    1259         /* Initialise function */
    1260         func->name = np->name;
    1261         func->ngroups = of_get_child_count(np);
    1262         if (func->ngroups == 0) {
    1263                 dev_err(info->dev, "no groups defined\n");
    1264                 return -EINVAL;
    1265         }
    1266         func->groups = devm_kcalloc(info->dev,
    1267                         func->ngroups, sizeof(char *), GFP_KERNEL);
    1268         if (!func->groups)
    1269                 return -ENOMEM;
    1270 
    1271         for_each_child_of_node(np, child) {
    1272                 func->groups[i] = child->name;
    1273                 grp = &info->groups[grp_index++];
                                             ^^^^^^^^^^^
Incremented here.

    1274                 ret = at91_pinctrl_parse_groups(child, grp, info, i++);
    1275                 if (ret) {
    1276                         of_node_put(child);
--> 1277                         return ret;

Smatch wants it to be decremented on the error path, but actually that's
not important.  What is important is that if this hardware is probed
twice this this won't work.  (Array overflow).  I think pin controllers
normally aren't hotpluggable so it probably doesn't matter?

    1278                 }
    1279         }
    1280 
    1281         return 0;
    1282 }

regards,
dan carpenter
