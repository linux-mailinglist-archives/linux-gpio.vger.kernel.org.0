Return-Path: <linux-gpio+bounces-29782-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43476CD4966
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 03:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43D393004418
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 02:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D32324B0A;
	Mon, 22 Dec 2025 02:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="lPahPrWf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688E83246FF;
	Mon, 22 Dec 2025 02:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766372153; cv=none; b=Mk694b2QNfDLzW1LTe3SFgpS+AYcUJ6X+aV/a0jdN8O/b6H9Tq3jdYb/dQy9Q8RessiiE7fOQ/oQ+WFM928EdPSZUqPM5M7gOoKW97SnJQPeaftJQCcoTbMBBvDqoyhLBMmroybFBTHQUaIsABsrdBk/af5dlYOY7a+KjV+3VkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766372153; c=relaxed/simple;
	bh=7CEqajst8BEMGMTxuhfyazlTZNKgGxx6H4k0UVO21wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETNsu5Jlwx5ZbmXT9L5OZdmUDT24mOrFiPSMgbvF+wRcqNVlPHW6c269Gxuu8L1FYS3lvbeclIzolkJKxJR1RXl9Nk9ZNJAaWtuV4l8pC3VRD1oir1NuSc+w2bAVdWTIB3SL8bojix1ilN9+wB+D976cTekgkpyf5++okSY0K60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=lPahPrWf; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766372062;
	bh=aWH3AozSjguJ/qtUp5vAwnVP8kUGmn82dw0UQ/1G5hc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=lPahPrWfzOgEAzNxMnHKClZP1RisOAI+Gqbur7ZYULDU5+HUEtRk80Hu9NHCXc3g/
	 8BlQco2ivOg0Ch2O6nfSrX76mNm+fOI+e/nC4HpxKO0d/nZtSu8+qKW9XGloYC58QZ
	 Y+WnVe70Q9cvQBDHP9aob9P4eYNPk4gwC8VcY7jA=
X-QQ-mid: zesmtpgz1t1766372060t7d1c31d5
X-QQ-Originating-IP: AU9lTnr49pGqU6zJR7M6OH6rqyvohYLLw/StbRivpDs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Dec 2025 10:54:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 537527025626833711
EX-QQ-RecipientCnt: 11
Date: Mon, 22 Dec 2025 10:54:19 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] pinctrl: spacemit: k3: adjust drive strength and
 schmitter trigger
Message-ID: <408BBF8CF676D97D+aUiy2w1iP1LJoUOW@kernel.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-3-f6f4aea60abf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-02-k3-pinctrl-v1-3-f6f4aea60abf@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MDqtQ4jGWXAGC96n/QJW5CqpNOGa29lPeU/ke22VWtG5mYgikCnLbyF4
	LM+3VxP3zFygJmLj9nbjC/3bq2TADA+TlpB6wPXfeJ5GRWix4z3vNDK8wNwl2XD4Prx0z3A
	bJ1gsiTeeKeX+LLnQFXBUAw7to7j01VAYd1jwskuOXIxXpw8N9QN6bDu4NAlFpMqQTYEHyG
	q4JPoBQWRbz7rNJO+3e/LAtzXlXU+VU6SOVpVjj6+8WMuZeJdVcV68DBHxkvfQDgpCaROv3
	gncjGO8AL+P769yWkgHyN2L3iHfgU6U4mvcQOjMq4kOW49zCn4teI2CC7l1jdE2LNZdLBlZ
	Z2smg/UvNWaUhOG5OkGwcR7N4mvKxRXSR359sjyTArnGtyHtmPfruNy/yh7ZkIPHl8J19+s
	FzJ+UDSIDynF5iZKXtb2t/i4s+IDwt6ZieVc3rLVhjjWI2wfoHhRvB+rh5xhsOJJ02TSTMl
	dKvFq3J4YEl26bWWBUTvmMmkIOWuXraxc5+5ZV6vG/OKvwOD7qaNCQtrFls2T5SshHtGGXV
	BlZW1XaLtPuyN4FpYo1dlYCxkks8ew91SHfib4EjQSGnihTxCgxsX2KcfBAA4TpsMYPzEJF
	i+QEe1u6elgWJDaI/9chfDUP5C4WxX6qRgW5gLc0+4dikkJI6y4Q069zNpQIgQ6P32W2LRW
	woWRC9puy1HLAhNmH1aeTkmHioYEbMtZ/mEh2UmoTq1MmjsPp10qyufw4xmgixM2ZO/vGqN
	zovDhaJsFgA9LXUxnQ2ujxGQhuCTe6pn2AixIQPxuZh3nruONWhzjmpHshQDgZmzBkmmRGq
	kO5P3AjpjzN2sIZ3Z1shR29AwB4Ft9Of5D0tg8f3RSMvTR4sO5t3V1KzHApW624Xb0ezdvm
	fKZuDDuL759vve2z4HulCAQ2ocSgAtgb1mkCiH+EA9I9aOGvx9FOmpXIDPwKtaYXy2+nEAE
	xIQELjikjx1s9NaWFWFXb+LNMyJc+a1ghBwqPr3ZokEk61pTLM4ExVH+Def8GWx1m50z96I
	RRMCVJ/Lj2LLJlba7AqTlcuSr5Qj0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

Hi Yixun,

On Sat, Dec 20, 2025 at 06:14:55PM +0800, Yixun Lan wrote:
> K3 SoC expand drive strength to 4 bits which support even larger
> settings table comparing to old SoC generation. Also schmitter trigger
> setting is changed to 1 bit.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 163 ++++++++++++++++++++++++----------
>  1 file changed, 116 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 441817f539e3..8ca247fb8ba0 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
[...]
> -		val = spacemit_get_driver_strength(type, drv_strength);
> +		val = spacemit_get_driver_strength(type, dconf, drv_strength);
>  
> -		v &= ~PAD_DRIVE;
> -		v |= FIELD_PREP(PAD_DRIVE, val);
> +		v &= ~dconf->drive_mask;
> +		v |= (arg << __ffs(dconf->drive_mask)) & dconf->drive_mask;
            ^^^^
use val here.

                          - Troy

