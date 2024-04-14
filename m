Return-Path: <linux-gpio+bounces-5479-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA08A4249
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Apr 2024 14:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7998281DB9
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Apr 2024 12:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6062B4122C;
	Sun, 14 Apr 2024 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ewFGnCEn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC363E47E
	for <linux-gpio@vger.kernel.org>; Sun, 14 Apr 2024 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713097804; cv=none; b=kNF8tKkdMhoChgRQ/TTx2Ddt0lr7+ZrLdzBvo29PsiVRSopnUzc1QDBK4UfmQJEdOHpSNPVSF6iFQi3MHLigVwEemqGaX3eQDrLPZXKVCH7CSJUY7P7MO6j012GPXE0LaHjIlTu7qTTvrxDvNMZaQCG/5BMzaGEeTJWUrKpD9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713097804; c=relaxed/simple;
	bh=qtuGD8Qi4HO+ZSdqf76Z5o59Yz2gkaVB/fgAlcvdcig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ONyrLcNSeejBcY5iS4GQmSOi28p6NF+yK3tvIccUPEGN/qHZDq4/EH8kA66g5TFm9raPjo10ddkzrL9FY2umPfXGrunwKXBOt2BjfTVcIM2ZO8AlOjJsags9UjBm8rvO0j54Wqvm9tsFwncIfgtdG7lCGYb322cSraX65pCOJJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ewFGnCEn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so3752906a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 14 Apr 2024 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713097800; x=1713702600; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hIs1bD9y9NsQj6kW1NSHcxE0175odmhzu852gkfegI=;
        b=ewFGnCEnsThaTAW/3acmQXmy+g2Uqe2GKZtMS6Vi4mhTVp5JgLWLr5FcT98MzBpOPx
         vkKlebYhk80zW51+ivLvwmfk8yGfGBcBlNBO1yS4PaJnDUItOT7cHuLRS3yQ+3HOgLHl
         XpCO5rGiFDD9zOMJikJEd/x9w8MNAKTn9+TE6WO4Y2NDRSIOPuCaQf4bsDErZHYqP4YE
         gCY2sYREy1jkTYhEIJkcCULAVTjuuK147/BXJQAi3JFDcjCWx8iDACcTz815lArjWvfC
         ouUqZfaPJXmwWToex23dAS0/jkkPoHSvpi88xsbpTodCyfRMqMCbXbbUBfbDrnQ9ioHs
         SoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713097800; x=1713702600;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hIs1bD9y9NsQj6kW1NSHcxE0175odmhzu852gkfegI=;
        b=vSM+l4Qo10p6CHnbnVX4pfktYOjs8DSqlLNxgroMQVxo1p/Qa5gCyH661AHJcO0xo4
         dPMXFULHV+LncvY0BWR6ROIPyKazFdX4J79pLXXtMLwNeWPyATsPpDrfFOCZZzM+unGq
         PCWZ/S1PZU3rUAQGFjOyTyqskReWghXfjjG4+mD9RDs7QtwE0atTCMBHp67xg4/C7E0z
         G/HdhW81ifAJJkE2nAKCEKQqqWHzjMieWSR1WVdRzuUZA5Daqvj6JETQmS79Dqa2KciH
         L9LPoGluh9kUga6m0bc85jEMxVCV1tzJcsOF8cL+JmMJb5eybCCO7OowPAkeCoHLG2tj
         JUzw==
X-Gm-Message-State: AOJu0Yy68mvdWUlsasckvXyIfPmSNLqGKcpoj9ubEwSxHhWeGodyiunE
	h90mZWSSC/itnxP70kn5RK3wN4iHfpuV1u0aT3q5lQGnAOczPa+fC8zKDz2MJ7weOF/MFf8uP92
	o
X-Google-Smtp-Source: AGHT+IFwr+gNRmOq9CKC+4GESGFYUZcAo31/rgDiivZsBuiZf4jGEsG/clVafzMhgYKNSENjyzOqqg==
X-Received: by 2002:a17:906:c116:b0:a52:35d2:2e72 with SMTP id do22-20020a170906c11600b00a5235d22e72mr6581105ejc.68.1713097800323;
        Sun, 14 Apr 2024 05:30:00 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id mb24-20020a170906eb1800b00a525609ae30sm1337462ejb.169.2024.04.14.05.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 05:29:59 -0700 (PDT)
Date: Sun, 14 Apr 2024 15:29:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: zengheng4@huawei.com
Cc: linux-gpio@vger.kernel.org
Subject: [bug report] pinctrl: devicetree: fix null pointer dereferencing in
 pinctrl_dt_to_map
Message-ID: <ec8acd44-f71d-4b91-be5e-1bf1b1aad062@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Zeng Heng,

Commit 91d5c5060ee2 ("pinctrl: devicetree: fix null pointer
dereferencing in pinctrl_dt_to_map") from Nov 10, 2022, leads to the
following Smatch static checker warning:

	drivers/pinctrl/devicetree.c:224 pinctrl_dt_to_map()
	warn: refcount leak 'np->kobj.kref.refcount.refs.counter': lines='224'

drivers/pinctrl/devicetree.c
    196 int pinctrl_dt_to_map(struct pinctrl *p, struct pinctrl_dev *pctldev)
    197 {
    198         struct device_node *np = p->dev->of_node;
    199         int state, ret;
    200         char *propname;
    201         struct property *prop;
    202         const char *statename;
    203         const __be32 *list;
    204         int size, config;
    205         phandle phandle;
    206         struct device_node *np_config;
    207 
    208         /* CONFIG_OF enabled, p->dev not instantiated from DT */
    209         if (!np) {
    210                 if (of_have_populated_dt())
    211                         dev_dbg(p->dev,
    212                                 "no of_node; not parsing pinctrl DT\n");
    213                 return 0;
    214         }
    215 
    216         /* We may store pointers to property names within the node */
    217         of_node_get(np);
    218 
    219         /* For each defined state ID */
    220         for (state = 0; ; state++) {
    221                 /* Retrieve the pinctrl-* property */
    222                 propname = kasprintf(GFP_KERNEL, "pinctrl-%d", state);
    223                 if (!propname)
--> 224                         return -ENOMEM;

This should probably be "ret = -ENOMEM; goto err;", but is it okay to
goto err on the first iteration when state is zero?

    225                 prop = of_find_property(np, propname, &size);
    226                 kfree(propname);
    227                 if (!prop) {
    228                         if (state == 0) {
    229                                 of_node_put(np);
    230                                 return -ENODEV;

Here state == 0 is treated as a special case.  Which is fine.  But
could it also have done a goto err instead?  I hope so because otherwise
we'd have a bug later on the first iteration...

    231                         }
    232                         break;
    233                 }
    234                 list = prop->value;
    235                 size /= sizeof(*list);
    236 
    237                 /* Determine whether pinctrl-names property names the state */
    238                 ret = of_property_read_string_index(np, "pinctrl-names",
    239                                                     state, &statename);
    240                 /*
    241                  * If not, statename is just the integer state ID. But rather
    242                  * than dynamically allocate it and have to free it later,
    243                  * just point part way into the property name for the string.
    244                  */
    245                 if (ret < 0)
    246                         statename = prop->name + strlen("pinctrl-");
    247 
    248                 /* For every referenced pin configuration node in it */
    249                 for (config = 0; config < size; config++) {
    250                         phandle = be32_to_cpup(list++);
    251 
    252                         /* Look up the pin configuration node */
    253                         np_config = of_find_node_by_phandle(phandle);
    254                         if (!np_config) {
    255                                 dev_err(p->dev,
    256                                         "prop %s index %i invalid phandle\n",
    257                                         prop->name, config);
    258                                 ret = -EINVAL;
    259                                 goto err;
    260                         }
    261 
    262                         /* Parse the node */
    263                         ret = dt_to_map_one_config(p, pctldev, statename,
    264                                                    np_config);
    265                         of_node_put(np_config);
    266                         if (ret < 0)
    267                                 goto err;
    268                 }
    269 
    270                 /* No entries in DT? Generate a dummy state table entry */
    271                 if (!size) {
    272                         ret = dt_remember_dummy_state(p, statename);
    273                         if (ret < 0)
    274                                 goto err;
    275                 }
    276         }
    277 
    278         return 0;
    279 
    280 err:
    281         pinctrl_dt_free_maps(p);
    282         return ret;
    283 }

regards,
dan carpenter

