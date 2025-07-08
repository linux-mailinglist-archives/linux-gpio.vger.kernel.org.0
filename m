Return-Path: <linux-gpio+bounces-22912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB246AFC567
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 10:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B8813AE95D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077152BD03C;
	Tue,  8 Jul 2025 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRh/2+3d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B501B0F1E;
	Tue,  8 Jul 2025 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962980; cv=none; b=KVuqiFosAS86SRlG/yzBc4l+LD10qiEwAkUuUfZcWr+IusEhizLVljhDdiYZKDTeYy56DUa7VxrKOyQcFZErSmVNmrSgzGYG9PcGB7SdZTXX0uaI2PKoSbLccmf5VHYIfgex7Jrg0ouvo1ZWI+Fxr6PfMuIcKzfv+3hrA89ir/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962980; c=relaxed/simple;
	bh=87sHydAEWp+oRdWVjEQNZfErNGUVGosh7/5/uQwaz9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFWeqpL3d5ZvAm5885gXXdMj6QH8DHxtUPOIFXHT7F3cTaULXWpJKECCIuAbXLAytycUcxpVD6KvX19uj/CRaWm8YNGDt6w3nmlI/4Y9a8nOvBzJziwqLG2TkskGJY51+pzz0l7wJZpmkt/oUlwGEZUjXvyfbthmvQhPNUUQKEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRh/2+3d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF920C4CEED;
	Tue,  8 Jul 2025 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751962980;
	bh=87sHydAEWp+oRdWVjEQNZfErNGUVGosh7/5/uQwaz9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRh/2+3dpSbDU3mXL02V9eqgLR/9/4sZtwJCjb9UnIyS9raEgPUynbqYrme4jhyaU
	 4EH3IQDu7poI1oXVtt0fmasBrSg34iiVfsJAfOu+A8Dg+yWBvbTt+auHBA5hoHBsta
	 9Y6avuRXrHgwcb3sJbZKKuP8EHw9Z2DwT52XoyMX/R25xWTkTOX72ErCSfClRqUlW8
	 Ckbrgkj7dJAeeFmP9cVzFh3iGu5V0fJCGo/hWCGBPuzEgAkFG+aNBW2SKa4a1orQoo
	 eJbBqU7pzfZ4+C5H99Jfsz058HWi7YHs1QEkLrVVjIc1kcBCE9yYzovr2TXUj6TirN
	 urUhckZQik0NA==
Date: Tue, 8 Jul 2025 10:22:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
Message-ID: <20250708-cinnamon-oriole-of-warranty-cb5ac2@krzk-bin>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
 <20250625-sm7635-pmiv0104-v1-1-68d287c4b630@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-pmiv0104-v1-1-68d287c4b630@fairphone.com>

On Wed, Jun 25, 2025 at 11:18:02AM +0200, Luca Weiss wrote:
> Add the PMIV0104 PMIC which is found on e.g. boards with SM7635 SoCs.

s/SM7635/Milos/ SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


