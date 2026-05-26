Return-Path: <linux-gpio+bounces-37514-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMSmDRFyFWpbVAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37514-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:12:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B685D3FC2
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 12:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7FB4301DAD5
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA453DA7D6;
	Tue, 26 May 2026 10:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GviGtrXf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8277B3D9DAB
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789972; cv=pass; b=Z1WcSP/th2cps/5DUWMN+OZ/fwYR71bGFZdSmME+4J7ZwrEOha/zCBZa8N98CcpXz4k5n65aB309iApPhcFqcJUv179fFAuYsUinea7F2AIdr8xH6E9rNfQHBXxJV9TOs7mK5+9TajzqEcf5aEfUljDNBcgg+spk8ewwTJDoUUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789972; c=relaxed/simple;
	bh=LzC78n/1cSkKY2MkbnFZtdzczAtKa4M13Zh07S4fs9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=of7rszicSQJWZbdLBoVxOj9UO/34WnlkXj0/7Ngnvi7nVM4ZQ0C1ybDiuii5so9g/ULWO5z8eHZ2dzPqoXCEx4Pf55EK3ZmyGCr//1dHLta3izbuREc8uTvypbSNOrmQ20tckqtju3k7npt/lZ+HDqGP4ZwVq2VGAxLXW8u8HOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GviGtrXf; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65eb1b25c77so4976817d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 03:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779789970; cv=none;
        d=google.com; s=arc-20240605;
        b=Hws7Yq7hqB7LEyVLpZsHqS28dknGjvvHlKFgXlSmrvH6xVzu619S65T/OvMrWQUYnO
         eOfaxHtHReftJVEQ4fOVc6vzWPuYHiEbhOHtONJymypGkDKxu8IMmnHiRPIptH2JZkN6
         rulZXrv+JNZbcV8vGAa+5EgQ4HuD4Orl4VK37uF4TDwf/sQDsYTxsSMuDbtF8KiY7/3p
         VrNnZedrbsJD0bwOgHozYJTG0FCJ1jdwJ5stniO6feWIMtLg3tuNsi/THR/8BiynriU8
         ST+ZHGrZf1JWwqLB23qerJgxQIIqpfDyBh8ceglTHpcQ7jaruMPtA6NudMfCjn2VAc4F
         M9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LzC78n/1cSkKY2MkbnFZtdzczAtKa4M13Zh07S4fs9I=;
        fh=o51YPPJueUtxv7MO8+bdFgyZgN2SSnWXchDIygNgDZ4=;
        b=alNkdths2mSa2WYdtiZa8FSFnBbVov5PA4tZ6QRaPMrzUeKnfC2FtAJdufZytdM+XN
         RK4LUv/PAziEr3QZFfVfE06JNDPLdADifbYDirqq6zRHmmlSPouSSpY5vFEkGEbJjQii
         q3nVs5V/yN5u4P6oKjapTld8g1w15rCkSfOu1vZrHnWnlQQAU1f906p0PSJFcYk4/nuW
         XiMKpyjVwrMFzwjH5NuawtJsWrjcr2yWNTd0KzfQy1Vy725+mAhviekvg3P7PJiLYjy/
         Y+e+F8IQo4F/xEqFQ2uueFGmsDRnh+N5AW9vTP9A33fEj8Rb2bzz902hci6KiGqki5+Z
         3zMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779789970; x=1780394770; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LzC78n/1cSkKY2MkbnFZtdzczAtKa4M13Zh07S4fs9I=;
        b=GviGtrXfvT92u/zxcXo9AEpbMCghGOWpWelI8m1Q38JNgID7Xv74MdWp7ZycmrPvB2
         +2rZFQrMIKmb269qm7Nv+qn71OmYo41zBux8y+AAiRCTbfyxBM7EiBI1mC3SCJ51xvzZ
         hK6N6Qfbqxzgi7ciQwLT7S7Ux0rJ8HQZfiHUHdUhZ62zyBoJucS4sPnXYGyhCzoJG7O3
         SQCmlFmq2tgCCEhBQEPLEa6BgB9N8I8UibxDbxwtH3b0tn+bRDTA4sN8sfG+SncpSOQ2
         lOBrNhMXMpqLvpbNi2qEelxjXf3mc+1vpuC8INQq/CRKNcrpnHPuKpu84BCRRB3NtqdZ
         Tc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789970; x=1780394770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzC78n/1cSkKY2MkbnFZtdzczAtKa4M13Zh07S4fs9I=;
        b=fTmoxtUB/SS0LI11D8ceV9IJ8EbAI9TSmf4vSinBRngaDDf9aPNU95ofM1LARFOQGg
         YyUekbeynxduni6261w0g0BMKMaLVrkC+Svd3+H6g667OkdinrapjwmVEEC51OkB/4AU
         kRFZ/g+Cbi57pU6gOquog/b89zbM5MZjKRa7G8CJ0fRo3L08cC4WloRlyYXztl1ICDc9
         UjiZ0HZY+FvvCp+3rjfCVbfw34aPiVicDxlS5OnL4Edfi3fkUMDsVEvEeszKiVIm9bCZ
         PRob3SJcXl8J9/tS/gunyw8+GCulELpMYTgPEjUMGp6W70CXDkWAFbZWe53n+ThVx/4l
         adGw==
X-Forwarded-Encrypted: i=1; AFNElJ/qi27xVS5MNIF5NbS+i2yvcxCz1NpsuNrj+vvUspxnex4jviJjB+TOs9+lzmm3yzS5TSgOoXHUNNr2@vger.kernel.org
X-Gm-Message-State: AOJu0YwIx58Y+Utr76Ulm2miYwsYP/gmJLXFJZHHlV9wrRui028GSD3t
	HqYI0GvbRdJQipDhFkiR4Z8pkt/xeFprAajJfPVSHV2bOZJGHSNYks83knijs8zTUrjTI7OPW58
	Zvw6bfe4yRwl40vjSeayVxh/RsjGrvPo=
X-Gm-Gg: Acq92OG7vC480bZjJ0TpAKAuMn6xDWdHyOQ7jiJU/k3RY/46MuvlJLcauBp4MrfBnSj
	bzam4Oilh4d9O39eaCw08X6qWLK0e3GcvAo24zT79EYaabmXKlXunrv54xddDGSn5L+aIVPbarM
	7TpeTO95+4MR2GUrRlh1DAklOM3Vsie33Ny/m0kIddZQEBm+oREFgx6j2DkgREdzgthBr8f3nsi
	Smb3thfMlVH58rdlQXJmBxJ5YHqUNuAJJ0awnmgTvzGHcEo7g4rDWkEOK68zBco7y20GQ/slJdB
	30WCxHQMhtDVu/lT5owp8heSKuN0SvUgVtaUSc2WAMsOKTczs0ZRLmaMpWUe3AsWq0Y13h7J2eI
	2WABN+59snmSNHudGdEjbh6sfQG+Xv+H+Tt/zLj9ueAanG3U+3U49VV991qk=
X-Received: by 2002:a05:690e:154c:10b0:656:7cd:98e4 with SMTP id
 956f58d0204a3-65ec96555b3mr13525257d50.16.1779789970393; Tue, 26 May 2026
 03:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523174440.9629-1-hardikprakash.official@gmail.com> <CAMRc=McOJ6FoLWYfFGeFgh20CNpFASj0gMtfn0+v25BqNUn5dQ@mail.gmail.com>
In-Reply-To: <CAMRc=McOJ6FoLWYfFGeFgh20CNpFASj0gMtfn0+v25BqNUn5dQ@mail.gmail.com>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Tue, 26 May 2026 15:35:58 +0530
X-Gm-Features: AVHnY4Ibft4-GqOxKTXkPI0fDR3Kssg7RiKV0mTuOEbmY3NWYUNxobWViGXQV7k
Message-ID: <CANTFpSXNLLYs526dGgXUGeOY2fuKcpsbGvqiuv0eE=W2305TKA@mail.gmail.com>
Subject: Re: [PATCH v6 0/1] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	andriy.shevchenko@intel.com, mario.limonciello@amd.com, 
	basavaraj.natikar@amd.com, linus.walleij@linaro.org, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37514-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B0B685D3FC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 26, 2026 at 15:12, Bartosz Golaszewski wrote:
> What happened to the idea of doing this in subsystem-level GPIO ACPI code?

I tested it and reported back on May 20th in this thread -- it didn't
work. The deferral in acpi_get_gpiod() never triggers for AMDI0010:02
because i2c-designware does not call acpi_get_gpiod() during its probe.
The GpioInt resource is on the WACF2200 touchscreen device (TPNL), not
on the I2C controller itself. So the gpiolib-acpi path is never
exercised when AMDI0010:02 probes.

The race is between amd_gpio_probe() completing and dw_i2c_plat_probe()
starting. Nothing in the gpiolib-acpi layer gets called in that window.

Thanks,
Hardik

