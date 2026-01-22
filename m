Return-Path: <linux-gpio+bounces-30905-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMlHJ/4/cmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30905-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:19:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F76895C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0984E308A244
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28DD352C4C;
	Thu, 22 Jan 2026 15:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyxICG9D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C22DEA75;
	Thu, 22 Jan 2026 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094672; cv=none; b=A8QdQhsipilSiOtgkOJj9p0T0ImlPBnRlQ48xJ6vEoRbirRNk7H0AWmOdZ6dd4Xj+GXI0pfDnMhmGhiHI2toyV3nIi3aYIN+e5Iy2oZuu3L9Kn9R1vtVmi1nzdu1ueHjOb+cCJsSJdZCj3mhOLtfilwqZpSY3tJghiOnWNL8/k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094672; c=relaxed/simple;
	bh=AhX4GlQSifCmXoV0os8qfTRxS5ViJKiexN3FOp4/KZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kT+/y1XGgAnjft/k6JeCzN9le0kYMZoeUCC1eEzDdTBsbGnxYdOtGY/cTRJ+GGjWbgGmB2C0XNI6j17TX/EefhOoJYjdVtZ7hdw4kuS5jvvcfPqFu0bs6NBDQHc3GJVW/7ZjdFiTRpqkXqYetHdINd/sIavlAhAmBV8z+CEszfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyxICG9D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A074C116C6;
	Thu, 22 Jan 2026 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769094671;
	bh=AhX4GlQSifCmXoV0os8qfTRxS5ViJKiexN3FOp4/KZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyxICG9D3ZbxLRJ6j2rXj8k8D/kB71qeABCQYCOEqKvnvhPldziHXw3omn7CA+mSq
	 +NjVSaMJHfyRGUFO+6hOfLeB98puQt1dOe71nYuL8in9lFMveblVQL5NwmhQlGDXFr
	 aS5zRASMUkbW/oQ8gLQlGmJtKM+HCL2a8AThyAQx4rADQUgZmM1U2WXLQlOqCgmhF6
	 sRXAL21UuACKEvjBEe+K+xKgL8/gQqDw98hjO3Kkj3m9x3xGNiBOSldX4Bg5zb7loj
	 0smvCOLeqreYuU6aBX02q6UbQbEcfrEHKdNYy+O2matML/d7Is3WMZeXkhrjRqwocY
	 GlEetanTfl+Yg==
Date: Thu, 22 Jan 2026 15:11:04 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Message-ID: <20260122151104.GL3831112@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
 <20260122150634.GK3831112@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122150634.GK3831112@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30905-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl,google.com,android.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 193F76895C
X-Rspamd-Action: no action

On Thu, 22 Jan 2026, Lee Jones wrote:

> On Mon, 05 Jan 2026, André Draszik wrote:
> 
> > This series extends the existing S2MPG10 PMIC driver to add support for
> > the regulators, and adds new S2MPG11 core and regulator drivers.
> > 
> > --- dependency note ---
> > This series must be applied in-order, due to the regulator drivers
> > depending on headers & definitions added by the bindings and core
> > drivers. I would expect them all to go via the MFD tree.
> > 
> > The MFD patches in this series also depend on my Samsung MFD patches
> > due to patch context:
> > https://lore.kernel.org/all/20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org/
> > 
> > While these patches compile, regulator probe will only be successful
> > with my deferrable regulators patches from
> > https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linaro.org
> > --- end ---
> > 
> > The patches are kept together in one series, due to S2MPG11 and its
> > regulators being very similar to S2MPG10.
> > 
> > The Samsung S2MPG11 PMIC is a Power Management IC for mobile
> > applications with buck converters, various LDOs, power meters, and
> > additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
> > a main/sub configuration as the sub-PMIC and both are used on the
> > Google Pixel 6 and 6 Pro (oriole / raven).
> > 
> > A DT update for Oriole / Raven to enable these is required which I will
> > send out separately.
> > 
> > Cheers,
> > Andre'
> > 
> > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> Applying patch(es)
> Applying: dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separate file
> Applying: dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
> Applying: dt-bindings: mfd: Add samsung,s2mpg11-pmic
> Applying: mfd: sec: s2mpg10: reorder regulators for better probe performance
> Applying: mfd: sec: Add support for S2MPG11 PMIC via ACPM
> error: invalid object 100644 11a56154d36d251d40b40e91da514db0faa15ae3 for 'drivers/mfd/sec-irq.c'
> error: Repository lacks necessary blobs to fall back on 3-way merge.
> Patch failed at 0005 mfd: sec: Add support for S2MPG11 PMIC via ACPM
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abort".
> hint: Disable this message with "git config set advice.mergeConflict false"
> 
> Doesn't apply to `for-mfd-next` or `ib-mfd-rtc-v6.20`.
> 
> Please rebase.

Also, FYI, you may wish to run some per-patch more tests:

"[PATCH v6 17/20] regulator: s2mps11: refactor S2MPG10" has no obvious style problems and is ready for submission.
WARNING: Argument '_r_mask' is not used in function-like macro
#102: FILE: drivers/regulator/s2mps11.c:759:
+#define regulator_desc_s2mpg1x_ldo_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz) {	\
+	.name		= "ldo" _name,					\
 	.supply_name	= _supply,					\
+	.of_match	= of_match_ptr("ldo" _name),			\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
+	.id		= _id,						\
 	.ops		= &(_ops)[0],					\
 	.type		= REGULATOR_VOLTAGE,				\
 	.owner		= THIS_MODULE,					\
 	.linear_ranges	= _vrange,					\
 	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
 	.n_voltages	= _vrange##_count,				\
+	.vsel_reg	= _vsel_reg,					\
 	.vsel_mask	= _vsel_mask,					\
+	.enable_reg	= _en_reg,					\
 	.enable_mask	= _en_mask,					\
 	.ramp_delay	= _ramp_delay,					\
 	.ramp_reg	= _r_reg,					\

WARNING: Argument '_r_table' is not used in function-like macro
#102: FILE: drivers/regulator/s2mps11.c:759:
+#define regulator_desc_s2mpg1x_ldo_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz) {	\
+	.name		= "ldo" _name,					\
 	.supply_name	= _supply,					\
+	.of_match	= of_match_ptr("ldo" _name),			\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
+	.id		= _id,						\
 	.ops		= &(_ops)[0],					\
 	.type		= REGULATOR_VOLTAGE,				\
 	.owner		= THIS_MODULE,					\
 	.linear_ranges	= _vrange,					\
 	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
 	.n_voltages	= _vrange##_count,				\
+	.vsel_reg	= _vsel_reg,					\
 	.vsel_mask	= _vsel_mask,					\
+	.enable_reg	= _en_reg,					\
 	.enable_mask	= _en_mask,					\
 	.ramp_delay	= _ramp_delay,					\
 	.ramp_reg	= _r_reg,					\

WARNING: Argument '_r_table_sz' is not used in function-like macro
#102: FILE: drivers/regulator/s2mps11.c:759:
+#define regulator_desc_s2mpg1x_ldo_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz) {	\
+	.name		= "ldo" _name,					\
 	.supply_name	= _supply,					\
+	.of_match	= of_match_ptr("ldo" _name),			\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
+	.id		= _id,						\
 	.ops		= &(_ops)[0],					\
 	.type		= REGULATOR_VOLTAGE,				\
 	.owner		= THIS_MODULE,					\
 	.linear_ranges	= _vrange,					\
 	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
 	.n_voltages	= _vrange##_count,				\
+	.vsel_reg	= _vsel_reg,					\
 	.vsel_mask	= _vsel_mask,					\
+	.enable_reg	= _en_reg,					\
 	.enable_mask	= _en_mask,					\
 	.ramp_delay	= _ramp_delay,					\
 	.ramp_reg	= _r_reg,					\

-- 
Lee Jones [李琼斯]

