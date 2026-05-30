Return-Path: <linux-gpio+bounces-37718-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICriBaq8Gmqq7wgAu9opvQ
	(envelope-from <linux-gpio+bounces-37718-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 12:32:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C14C860C20B
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 12:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 672D8300DD5D
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 10:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42312384CF5;
	Sat, 30 May 2026 10:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUwr7Xzp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAB7199949;
	Sat, 30 May 2026 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137111; cv=none; b=KxCwAPTChpL6Zq9JXHojt7qFdb6iY6p7bl7yo7DRUvbIe4ZflwAuTBaKhXYsL5+VLGZEc01n7k9mH7BgXxU6AjvB55a0Ry+prITi1gj48DsCnJssunFBfOPgaPz/cFvqfaBLYF3WNkxKuQ2gTsNlOd4sSlAiImhwLenvYhKOX40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137111; c=relaxed/simple;
	bh=LbLyqqUs18bj4SHAPnZh8KMll6Gi7nK0XLg9MHQpX6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSktHPt1H7Dm3+feJ2h8OD8jZo3zax3WEvAMC44XdRQrig3ao5pmSyYdjiLGZPZwO548gzwZGK1eAGFkXlk4dWKNiHSsEFKmfgKmdgBlCjqHWg1McTBJJn/EsXgElGaoKyZrMBRAlpORFabcKYm5DcjeI52z84+4bosWBg2iYf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUwr7Xzp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F6C1F00893;
	Sat, 30 May 2026 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137110;
	bh=3I60PruLkgIIt020FSLnnNvhD8G7W0MWC85bAum3ALw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RUwr7XzpKWm/ANV9bmYgKduesMOYngK15O220OQWzx1kttGNm3PuQWngmCdX4HTJs
	 PW0cZftbP2oOHTqmjm/ymgNky1bQSYZEqStlDZMMtdYlo7FjhGy5eZ6Ss3qagG1hy0
	 yPRbLDbcifA88ppCTulHZVuaMuxpN2ZzONT33CmEpXFz9+FNOLAtqeIoTbHw5hyHt2
	 CZzxLR//PGj5aKhutI3Ta1drFeO+vOvsnLYPbzOiFBCHwxmAXxDAFj2N8R5R+TgrZ0
	 uuE5WPL6uSErrC/qbt9vEUicd7yWGkTRjFT14lb2q2Lk/VLyYgpzXFZUWtVpqsdcED
	 kQXeiFhwKPgjQ==
Date: Sat, 30 May 2026 12:31:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] pinctrl: qcom: spmi-gpio: Rearchitect for
 flexible group support
Message-ID: <20260530-fervent-snobbish-silkworm-24ddae@quoll>
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-3-3a6a025392bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528-pinctrl-level-shifter-v2-3-3a6a025392bf@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37718-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C14C860C20B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 06:05:37PM -0700, Fenglin Wu wrote:
> Currently, the driver treats each pin as a group, and every pin or
> group can function correctly in all existing functions. However,
> this approach is no longer valid since some PMIC pins only operate
> together in specific functions, which are limited to certain GPIO
> groups. For example, in pmh0101, the level-shifter function is
> supported only between GPIO pairs like GPIO11/12, GPIO13/14,
> GPIO15/16, and GPIO17/18.
> 
> To better accommodate these new functions and restrict GPIOs to
> those that support them, rearchitect the driver to enable flexible
> pinctrl group configurations by utilizing the generic pinctrl group
> and function APIs.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig             |   2 +
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 377 +++++++++++++++++++++----------

And now make this built-in and RPMH as module, then build it. Does
it build?

Best regards,
Krzysztof


