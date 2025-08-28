Return-Path: <linux-gpio+bounces-25042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFC3B39515
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 09:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B7003B4E4B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 07:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E862C08A8;
	Thu, 28 Aug 2025 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZl18nnn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4722130CDA9;
	Thu, 28 Aug 2025 07:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756365922; cv=none; b=CB5hxi30tm/BWlvjyxY9A1F78PUbaGCYvUFScb0EOZ9fNg1FuzXT4eHaW7rxVgtxnHVaMak/YPIP0OSzX1b79p+blmBF0hE8rsfaWcYgWyq0b82+kFJ0GjwKtHtGjo125RsZiJcoU6oTJAS1Won2nIcl+eg4yiQEBJ0YMFkz4PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756365922; c=relaxed/simple;
	bh=2xmUxxbnZRFfY7nOW7Ta4ARgAuSVey3Yvt60WAVlxGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMqZFLFQ4pTeYpnPFAQOT5YyW1FkvO6t5gKSkyk9vCr2XxHuQwujNDlnmiD6Ej/LvCxV9k710137u9Lklm1UFUZFFpBY0PNuU4QD2PtuHe4pQGNrZ0n4kaP08scmijCuc1sNN183hBfGVs7nV0jhyvLUbJ+PPfHFESpibNcynYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZl18nnn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E20C4CEF4;
	Thu, 28 Aug 2025 07:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756365921;
	bh=2xmUxxbnZRFfY7nOW7Ta4ARgAuSVey3Yvt60WAVlxGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZl18nnnx7Ol9IYoKSLa0ouYGiiMJQXROK7kPJtUk8pQSBwD9XYhFXpJDaD0O6Iv+
	 QUZd2/BAlPbBxXSHt2St9uJDlfHs6AZUbezIQTHgylO7T5DkktmRIM5+lFHzPvPFyV
	 4SqalD5VIXoiH78ef+OywLKR78qyk+mPXiWVRNYyUx07AywX7F5vQ1ACN6ylWG9SLX
	 vOsy1ZsNOGUuduQxvPvtyfJ1I5oA3hkpchcRk+mL56IX3u/Hp22S9izH+mGrWmt1+f
	 Qvn8B8A/s8bavLrseb+lllBmbJk66bJPlzJXPvtvoIz7As8JqcxWvodkwKEIaxwnlh
	 s3h5vIpglTYvA==
Date: Thu, 28 Aug 2025 09:25:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Message-ID: <20250828-ebony-frog-of-luck-dfbca6@kuoka>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827024222.588082-3-gary.yang@cixtech.com>

On Wed, Aug 27, 2025 at 10:42:21AM +0800, Gary Yang wrote:
> Add dt-bindings docs
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  77 +++
>  include/dt-bindings/pinctrl/pads-sky1.h       | 592 ++++++++++++++++++
>  2 files changed, 669 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pads-sky1.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> new file mode 100644
> index 000000000000..10a4a292188e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml

Also: Filename based on compatible

Bot reports here some warnings, so please confirm: did you test your
bindings and there are no errors reported by the toolset?

Best regards,
Krzysztof


