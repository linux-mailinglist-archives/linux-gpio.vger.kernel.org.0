Return-Path: <linux-gpio+bounces-29866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB96CDB349
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 03:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FC0B302A974
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 02:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CBB27B34F;
	Wed, 24 Dec 2025 02:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="OQoHIOsp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A012E25F96D;
	Wed, 24 Dec 2025 02:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766545076; cv=none; b=nSoVMpUOgf2SSK+dkSmtYta+GMSeITz07MHheRhqkWmBjDjjN/l89d82s+uBR6cFsWpij4gMO4EdDODcA4sIrxd+RzAcEgBRp+DiNEW4s7TMz6PdjKfKJLEE04DmRfFIS4SemoOY7fn3pmSNQReuc0sJr7BZc2No0qwE8ECRL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766545076; c=relaxed/simple;
	bh=7lROny5Tge0kHhh8J5Rq9wnPXe82+bezEHVpY85EBso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvzDg7sQFe0uvo3jXCjrKLpig5qU+FpuMIFfshJwzpCCAkl5mQ8oqd9s/QEjcLGeE3hk+OvxVYHuwGbk/GuDB5d8jyTBYPulU/3EP3SfYchxs9ksbG9RPsBlcr+XpcnncXoRzuj+FO4g7sYkot4iCpazClluJ8jXxoWIxRq4sms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=OQoHIOsp; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766544994;
	bh=kqmD9KzPofpBkzhYXj3pS9Rz14dgYcaXw+mdYqkGSmU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=OQoHIOspfBKFLmhjKkTuv/gh0sTFRGK5Q2nEbbos0BPNKxk2DBJfDO69ZWI1Ec9Vd
	 jmAra/QY/HDExEoYbxa3PEvG2k/4zLv7mHyDtxKbVWirChOsCnlxXTD59Xi7zPDgfN
	 FyFwyGpoES7QGFpbKzRohuLi3yrm1AYkqm8hoIM4=
X-QQ-mid: zesmtpgz3t1766544992t73a38fc5
X-QQ-Originating-IP: rtoro2YV/3fXqeddsOLVmiGvuBnIxcaaNAkjFCG+GJw=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 24 Dec 2025 10:56:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15150131563580533562
EX-QQ-RecipientCnt: 11
Date: Wed, 24 Dec 2025 10:56:31 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC
 support
Message-ID: <8840B91CE3D9278B+aUtWX6fizXnheGMl@kernel.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-1-f6f4aea60abf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-02-k3-pinctrl-v1-1-f6f4aea60abf@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MfJtHqZtrd+ORU4zn6lBUs2gKRknHpX78VxNZ/1kWuCzh6l+l2WAA+/T
	fad2+uhblq41A5eaTtRDLaAQRcfOeqIp7zcaPTSL/gac3P2n4O1zhCgXSd713Gcz7WKiOLa
	kXmXqiEq1x5zNYEIrzfsbQyaU2HfdqSVJFhUYfvFkarkXMqdS51Qnr8t4VfeQDpVocu62Qe
	9/rEg5f4iL49FGvxbIYtNlc4/O+CDuQTS/iXXmr66J/vl42+doHIY5PBQp0HrOWs98k+CM1
	qfpl21DKr/oZBjB9JTBv9N3YPy+xMq1WE6TDdtHUo4mkyEsGZfjQvK+vYM82WtNHa0vBlmX
	c4dQBiFsohqzLj/QMDlfHET4h4SNqTcM2y8LqV4VJFpb+17yPwLaXnrHhDDLrH8cgen/vI/
	vofbcufut19cQq2ueMhKBqZwlV45aEzpSq+vnhqLvK8MhMapeSHjxVlWQ74aCEleAWOwdES
	TEKZ1XRNCapQhImZJdum3+vp+iPA3xDDjIUFLAJ5CxZ/SbF2SOpB1X8zFTv5CBD46/D4r68
	NmS1W4mkta5uneU7vg1Af/K8Md5xM2LrtVa50ftxY4Kr0u67DZeDoHsn84exRUq77mkThAY
	WxZaWMDhd8SBJDPk953AltRx4VTdKfTljgzm8fwnBhJiDAM3d3d5tRVzx61Z/GA8GtF223A
	2aDRiiYaHXyUyTdEcnc1SuTkN584TX8mwgnmzrE/Hnd+GHXYokmJIuTyqX7T1HhwqamHCUa
	S2jE11ovs2HzRSnVkZPsgJCMpWEKhFvQ7driar/i0UgXlWedHrsaIMrOfbXaPl/J31YRBbq
	jO5jbrgsJ0huj2Ohqj1wZt7SQ+cmWuhn7uUA2+Xo5sUOfNs1hHXpHYnol2gQl90+62cZQT/
	ShyoyccjSE7KkjJKl1e03gdQWe9Lu8F922y6auqoCOhKcB71PWeccvBbGnSPDnIzgwy9u6t
	k3iQJNFIr84cjPh0mko7FusweS2RjrjMyrXgjL418mM9Mjbg/iXDu31V+y9vZzZbmbqeXW1
	FxjF9E5GnwKQoz1Zuq6npCZx8XiY/Y5iuU65G0kw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Hi Yixun,

On Sat, Dec 20, 2025 at 06:14:53PM +0800, Yixun Lan wrote:
> Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> almost same logic with previous K1 generation, but has different register
> offset and pin configuration, for example the drive strength and
> schmitter trigger settings has been changed.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index d80e88aa07b4..c5b0218ad625 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: spacemit,k1-pinctrl
> +    enum:
> +      - spacemit,k1-pinctrl
> +      - spacemit,k3-pinctrl
The drive-strength description should be updated. The driver uses a
different current table between K1 and K3, but the binding description does not
mention K3.

                              - Troy
>  
>    reg:
>      items:
> 
> -- 
> 2.52.0
> 
> 

