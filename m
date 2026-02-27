Return-Path: <linux-gpio+bounces-32274-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMpDARmDoWkUtgQAu9opvQ
	(envelope-from <linux-gpio+bounces-32274-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 12:42:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 401E91B6B37
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 12:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16B3730E0507
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 11:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F27C3A1E6C;
	Fri, 27 Feb 2026 11:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zEPFkOb2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A1399034
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 11:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772192452; cv=none; b=c95V8fbzD9q52d65GEXoFy+sot8ekhA0ssQsV9eWXLFwMOj5BAvRXqPBw+7uloYazrB+Pnv5XhwiAEswkNmKRxqSWFkF1SprjKn+YrCXuUaBB3Fb4eWJ2wX50ZlOTU7mTYBBtSvvQIJPRAARqLeiY7dKdepeuHeIMwM4qU7w49Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772192452; c=relaxed/simple;
	bh=Hpd11Qce3K0sAdGPwWx4jlL1XK202/cqdnbo4q1+/lM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1bZc6s4Tha+q2k+ji/LsAfgKWJMVte0w8la+M6s7v7XJ9pxqmN2MlFkBzISC4JUfLnLk162bIRaygeQ3qCxxqDQzl374Nqb+SHSoXdBUD9q2nAPDrulEhXVQvkdNr/4FC8kd93CK/bHbgNl+8f6c9gD517gHbojK2wkJpcZ1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zEPFkOb2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4398e850783so1362435f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 03:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772192449; x=1772797249; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=trKEZykxB+kKVxup9W5xNfloninxPoc9C7n5gXHkqcY=;
        b=zEPFkOb2VtrYEjBLj1c9L6rF1b1PZ+afI3o8So9kFjJ/vILwgvGQSgq9q4ew1wp6/L
         nO4QZYdFDehPbwwQg3K5Ua6BCpX+GJOKCk06FcN5oQhrTOD34aLo02nX6gqF4W9JWNX8
         kETxlpAFKtZorTNl9lXb5ia0LuRmvlJr4kvkXY2zzX3YY4Pa9ucba88RTv8VOv5m4QAl
         hFE4MVWqFPyhGNtZQ8n1tluuCQrbp2MOBtbvI6y++Eb4paIa7rr/QBSCAn2X6s02c4J2
         2/hueAXWz/bM/ZwXL+LJyBEfq77ncgs+mv94uC+wgREp6aD2rzW+7TAfYaXljAqbfetq
         NEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772192449; x=1772797249;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trKEZykxB+kKVxup9W5xNfloninxPoc9C7n5gXHkqcY=;
        b=w7ccONam5LHmQ1av3h3KSbZmnIqflxNdzCiGfUbulEmMoSd1eBO1e6nU4TyRVUKQ8N
         YbAFBFLHCnIWcOqUxPtzOGXiowqxY/ST/gYN7PLYg3kivTIikuHJTkdNGw0bcmhvyMBL
         EY5ifb/mCA/aBZhJvIYm4E0YixH0CdHARLoKk6t/xbB9/JGc05EDQLgvhFPGxEm47TOa
         6Ab8RcOPODtqPVKPOcjt0j4fPsiUG4BSxZnAAjvMhZtJyx1CuI3729w2jb5L5CiBb/lc
         5faXo/SF4aOO1KHGWw44EXyjeiQtx7dwxaHn1+jwR9SVKzZOKVa1wJ+gbsBExeHXCoZR
         qdiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdiVyPu8mfyQmBPiKETwni1qrmDOGdbn2u817qUIc2CJgovB6G5Cr3f/IlX5fDGa1d6OwI6kCXydZv@vger.kernel.org
X-Gm-Message-State: AOJu0YyYx4ab/7VD866kRfQZZWlF2o1F2N20wo6GnZNxoPkBHgjxVB9k
	SP6rQgblH+kL2/oG6dkANsaoZGjMoXwBbYpr3uSQxyT4aw+QHsNrF4HQyt+ex/z6URHp2rjGvlT
	KcGd6
X-Gm-Gg: ATEYQzx+6VNfcOfm5R4ryr7hpm5TqznsbcjTyIvQTYLpmP1wtRgVGkYyQY9BtA7Vasw
	+8cXZiiAdIYSFEohb18AKBKz9goCt23y2PkYLPayKiJYyVYdb4yr09Mb29ALkpJq/w4ItQn+S1g
	6duYOpGQ4IaQCDuZtOaiax5f/g+kCagyKrUHMFF4AEID794D9rNet4HPiY4iLDaL3VvOu8Nk2cL
	Iu/7n9p9H0COYHjxUYd5OIWxlaD6Id5UfpTwg9g+zbzg9kSjAzyfaRXB4UCAbVNwvwvc81zh0ZH
	w8xTkLyOPWldt0DjPMHtIqhZicH+wY8JwmFInVbmfT3CvrdVoyN8+WrUsj295mDexscWkN1dLl6
	cmM1HByaO5md1peArLWut58ZElJaq0ZPYtEzrxvPhyNcVn2HznAdqxHrQuyGWy+RCf9+wtpOmla
	gqD25kzfu72EUPEEJufWq9LXZTKeIH
X-Received: by 2002:a05:600c:3b22:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-483c9c2d29amr35477115e9.30.1772192449143;
        Fri, 27 Feb 2026 03:40:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm232406355e9.9.2026.02.27.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 03:40:48 -0800 (PST)
Date: Fri, 27 Feb 2026 14:40:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: [linusw-pinctrl:devel 16/22] drivers/pinctrl/pinctrl-cy8c95x0.c:1325
 cy8c95x0_irq_setup() warn: passing positive error code '1' to
 'dev_err_probe'
Message-ID: <202602271847.vVWkqLBD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32274-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:email,01.org:url]
X-Rspamd-Queue-Id: 401E91B6B37
X-Rspamd-Action: no action

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   a901e8705f89f3616fad3bb6aeddba33be86b08a
commit: 014884732095b982412d13d3220c3fe8483b9b3e [16/22] pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
config: x86_64-randconfig-161-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271847.vVWkqLBD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602271847.vVWkqLBD-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-cy8c95x0.c:1325 cy8c95x0_irq_setup() warn: passing positive error code '1' to 'dev_err_probe'

vim +1325 drivers/pinctrl/pinctrl-cy8c95x0.c

e6cbbe42944de9 Patrick Rudolph 2022-08-16  1309  static int cy8c95x0_irq_setup(struct cy8c95x0_pinctrl *chip, int irq)
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1310  {
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1311  	struct gpio_irq_chip *girq = &chip->gpio_chip.irq;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1312  	DECLARE_BITMAP(pending_irqs, MAX_LINE);
970dacb3b9f0fe Andy Shevchenko 2026-02-23  1313  	struct device *dev = chip->dev;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1314  	int ret;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1315  
5ffb2da4a38fd8 Andy Shevchenko 2026-02-23  1316  	ret = devm_mutex_init(chip->dev, &chip->irq_lock);
5ffb2da4a38fd8 Andy Shevchenko 2026-02-23  1317  	if (ret)
5ffb2da4a38fd8 Andy Shevchenko 2026-02-23  1318  		return ret;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1319  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1320  	bitmap_zero(pending_irqs, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1321  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1322  	/* Read IRQ status register to clear all pending interrupts */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1323  	ret = cy8c95x0_irq_pending(chip, pending_irqs);
014884732095b9 Andy Shevchenko 2026-02-23  1324  	if (ret)
014884732095b9 Andy Shevchenko 2026-02-23 @1325  		return dev_err_probe(dev, ret, "failed to clear irq status register\n");

cy8c95x0_irq_pending() returns true/false not error codes.  This was a
bug in the original code as well, but it only was detected because of
the conversion to dev_err_probe().

e6cbbe42944de9 Patrick Rudolph 2022-08-16  1326  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1327  	/* Mask all interrupts */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1328  	bitmap_fill(chip->irq_mask, MAX_LINE);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1329  
f5d620254c9787 Andy Shevchenko 2022-09-02  1330  	gpio_irq_chip_set_chip(girq, &cy8c95x0_irqchip);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1331  
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1332  	/* This will let us handle the parent IRQ in the driver */
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1333  	girq->parent_handler = NULL;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1334  	girq->num_parents = 0;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1335  	girq->parents = NULL;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1336  	girq->default_type = IRQ_TYPE_NONE;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1337  	girq->handler = handle_simple_irq;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1338  	girq->threaded = true;
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1339  
970dacb3b9f0fe Andy Shevchenko 2026-02-23  1340  	return devm_request_threaded_irq(dev, irq, NULL, cy8c95x0_irq_handler,
1ddee69108d305 Andy Shevchenko 2025-01-17  1341  					 IRQF_ONESHOT | IRQF_SHARED,
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1342  					 dev_name(chip->dev), chip);
e6cbbe42944de9 Patrick Rudolph 2022-08-16  1343  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


