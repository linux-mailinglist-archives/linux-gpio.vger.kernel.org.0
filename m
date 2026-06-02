Return-Path: <linux-gpio+bounces-37777-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKDPHEtkHmrCiwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37777-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:04:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E31AD62855F
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80AC93063679
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 05:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0505325B0B7;
	Tue,  2 Jun 2026 05:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTqlyFxT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8394280331
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 05:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376529; cv=none; b=C+yv9v+nN8sGz8P1P9mA7q8DybRl1IstCTm/9DsEo9U5uivQI2L/McrW4oX5qX43y87yjLqgi7m/aAn6kdh5ggZ10cg70eqZobEFb8Vtw8i91FZZ82KIek+6SgrjtwXIVmil1pi7zJjr8oZkCsEA6zgEmF04eP44L1fYl7oXSXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376529; c=relaxed/simple;
	bh=JSVa/7L94pAgW7eStyxeqPWGUrAP28rRgMZHcvTi0Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LijF7UMbfmWYizeON6PkvQCBeu1hxzEiLu7gwF1EWqfLvKjc3LIkqfm5dBc0+gjjdsgsKcXHxDPunggyp1vj22YDeR3ryVtFiHn5D9ftQfpCt0thrG6ETIg9jdT3Ztf4YMhITYlfklPAEHJIDYYMCTeuy1y/cCfZdsk2AleurXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTqlyFxT; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36c68964315so1504547a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 22:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376528; x=1780981328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Rc5e+pcCQNLSk7M/61K5VybU7Xya1+dcR9m3vlqSb4=;
        b=ZTqlyFxT+iE0uytSxPiqMsyKiMSn+vOcU3Ie5DmpwMRU422A3sfKR/KDyRhmxMYoV8
         bN6G/7DGWnk5k1ZmjF5WfwJ0t1HmIALXUyo9h8yjfLqIGdItfs7NX5431QZRXUR3G03R
         Dt6njI+wXJCS9HS/AaJ5/vwrs5l4Mpo/d8KCvk/mGVwvHG0z4HsNShxX7yVdY/RPSWlo
         O1uBwW3ORuILEPH+MG9UaZ8BdpD/U3iiUsg7UJkOnH5rRJJKFqSEaUz+wjsz4sIKBYlc
         m82w0+OUqE1Uprs2xBFv2+xU0tDEaAbM+e8Jy94g2Lh46pGICDnsc9eCUcCKlemNwxJm
         xepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376528; x=1780981328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Rc5e+pcCQNLSk7M/61K5VybU7Xya1+dcR9m3vlqSb4=;
        b=Y9fIEztUZ/hev/viEUTjaCjOAMdLHcM45Qo2UpZokENX4niYYozv2HXsyPNflm3lWK
         vKCqpVwyqXPN+RbPwaCvJz/cmtCYc2WcxYeuRIV+BxRTFVWWXmSwYYINRZKUERKFPsVN
         uwL4GYlKx8tyRRb/dEFjCVesaTMqQM1L+SK9KVoMnZHDxqd3JiTD4HgErtpg4wA8M3qX
         V8WPk2pEyMpgzLJ+RDInj306CQKdbtcFdYhw1Qoa0vPLyrAyU6aOFCodtLRV2t57mMj6
         EGTyoYrx0hBJ+CHV8kICGinjZy7iJngnhXupiYa6VvHHllwEM/Gj+5J5BLZJ8nDGTD4B
         mehQ==
X-Gm-Message-State: AOJu0YwPGyNsFxQ7FQ0LMMcWITumP6eTDihmbqOnv0nu/9diult7uIpY
	fyxIJ23Motr9rWIYC/4E6s6UNT0ETAjOmfDfNLy7vCFpGdfF1hTGZpIpDFMHs/Yp
X-Gm-Gg: Acq92OEDKJhofHBtFNIBGV6DiQd2Q/voxZVYKgeH5mgfLS97v1JYAQu5groYg0EQgZu
	9xdHVq/RwQGxhG1Su9+3P1T5xjwOkaGf810OOPpv8U/jNNYqxR0b7WiPco+7iKfuiMQMlshQcIv
	7JKZpgX42uAuxgGRvos059D69SwnNkrQSshsuDJnBr8uB+S40Bkz9efM0ubgtAEw1kEsAI1hxXA
	21oAJDx01TbK/ooTT79oG9A4xNLkzfSSyyOrfCxUorlQa+4Df3kk/9Wx3dHAICjnWNAr0vXDmr/
	GuA0qBTDCDHOD9HDxe35cpgCN8Pf/Q230SnMIwZwhVuwqWLzuEqvuFZe8pYtXoCAOWHZRLwbtDV
	WVS3PWpfRjOdNUMIZnxu4eiJUt4qmcs3+TPM468aHxN+P7mXvSOS/dDz38n4+rTk8Nvxb5VCGmJ
	6tKXpVKwmLTqeeduZGu7jwadFp1rpq1VgPl5B4kn4RJlyzfsjUhDuZoZ9kb7zpIUv02ZrbXXsW6
	3NqjdBRi+xIR4vd6xbFhzxT4rjP8qU1ftJztusUpZRY3Q==
X-Received: by 2002:a17:90b:540c:b0:36d:c159:8f11 with SMTP id 98e67ed59e1d1-36dc159997amr5795090a91.26.1780376527983;
        Mon, 01 Jun 2026 22:02:07 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8589d055c7sm8958467a12.9.2026.06.01.22.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 22:02:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/7] gpio: ppc44x: add MODULE info
Date: Mon,  1 Jun 2026 22:01:31 -0700
Message-ID: <20260602050131.856789-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602050131.856789-1-rosenp@gmail.com>
References: <20260602050131.856789-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-37777-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E31AD62855F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fixes:

ERROR: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-ppc44x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-ppc44x.o

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index cc7796e0cfbd..425ccbc234c8 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -211,4 +211,7 @@ static struct platform_driver ppc44x_gpio_driver = {
 	},
 };
 
+MODULE_DESCRIPTION("PPC44x gpio driver");
+MODULE_LICENSE("GPL");
+
 module_platform_driver(ppc44x_gpio_driver);
-- 
2.54.0


