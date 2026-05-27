Return-Path: <linux-gpio+bounces-37577-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIEmLNzjFmpIvAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37577-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 14:30:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D4B5E4343
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 14:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CE4930589EE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 12:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592443F44DB;
	Wed, 27 May 2026 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZTuskDt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041363F39E5
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884704; cv=none; b=HnsJs5ZDVkRPjsjnZ9uuNBwLvalrE4s44YDvOAJ/tSQ4jgZhB3xRapjbJoCKMZAWnmH4lbN/V08ibsVUK6KFE06v2Lsqm6Jb1Tc1R5hFlqrr4sGqf/ir5t65+GCJiKV7NwkGPrznHhccOAFv+PJDPMRo0SHX6mdAlNMSfjVgg/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884704; c=relaxed/simple;
	bh=Y6f/yehHzeS7UPElN3+GeJhf5G5CU1fHPQdO6Pdb9cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYjAjfaPgoiEFLCctKTyy+cpdfVFZjVhxaubwXBMRC9pSlAub2NgK5+OXwgD06rbUt33Sh+fdrHlt5jy/V4Q5WkNkr9L9XuJFDxPnCo2+LRxGtTlZLdxTMNPHBT8fYf50wMY5uLeouWLc9Cfruz1y0ucaHVTzJ7jKf9jYodOmRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZTuskDt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B351E1F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884702;
	bh=Y6f/yehHzeS7UPElN3+GeJhf5G5CU1fHPQdO6Pdb9cU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PZTuskDt86zKAK2SHlS2DmmupuvuLar81yut7gEgXxO+v1XGv45BKajzR+JkHVgNm
	 oI+T6gsaH5/OIdK6zA7ielHz15KitA1l0l/u9K1NV/SgIfErWC6R7JLiHPomY51sVt
	 CZ9wZ7Rp5x6vDLUEqyICdrjjB+wt2om+Q86F+1b9xnEdN7VyR7IQAnhB+th5GH7Wf8
	 kK6X7x4EoXjRxZS8aLsI3Nwifmo1WmhaEyTYNIc8tENb1DSmIqERkMOFseim1jODX7
	 lF5p5cUtHT8GLw5mgRnsLmUbRKPwt2zEfppEPUr+ER4ugpi7qO7LVWnr/e+MloYBGq
	 xp0kilMx7bxxQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa21fa024cso9693758e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 05:25:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ84IqoyK1N1UZHe/NcBQk/SvX4nuudvM/r01/vzA626xgV3S8b6FeOgPCUonyifVqVNQq7sr4jhB/m5@vger.kernel.org
X-Gm-Message-State: AOJu0YyqnCXN2kDtinwDnaH3/Jyy1HyWLzPV0loCy5h+ZZotJ6cQKh42
	4V7LurW65fRE1Xz8N6jV25ftUpfuZUZCpc18Cg/ye4PUU0YYjnoeF6bsKcSPVlfKBVzSlnybZ7b
	oIGYLXQP4g3A98jH1sKSZF4QY9692p+c=
X-Received: by 2002:ac2:4bca:0:b0:5a7:46e6:74c4 with SMTP id
 2adb3069b0e04-5aa3238b614mr8273516e87.9.1779884701432; Wed, 27 May 2026
 05:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508143453.1886569-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20260508143453.1886569-1-ckeepax@opensource.cirrus.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 14:24:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLno-RpE=hSokofbBvJeF4Z7jaxzPOhnWbBhSUzD4KVAUw@mail.gmail.com>
X-Gm-Features: AVHnY4K2BNm1CVxLZgC5GPjS0MD8asyU7_SUwGdL8xeDTiL3MM-mtQpMSGCClYo
Message-ID: <CAD++jLno-RpE=hSokofbBvJeF4Z7jaxzPOhnWbBhSUzD4KVAUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: cs42l43: Fix leaked pm reference on error path
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37577-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,cirrus.com:email]
X-Rspamd-Queue-Id: 24D4B5E4343
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 8, 2026 at 4:35=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Returning directly if the regmap_update_bits() fails causes a pm runtime
> reference to be leaked, let things run to the end of the function
> instead.
>
> Fixes: e52c741907fb ("pinctrl: cirrus: cs42l43: use new GPIO line value s=
etter callbacks")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied!

Yours,
Linus Walleij

