Return-Path: <linux-gpio+bounces-23337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5360B06F1D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 09:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 564CD1A62334
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 07:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E933B28C5C1;
	Wed, 16 Jul 2025 07:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnym7igX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987312798E3;
	Wed, 16 Jul 2025 07:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752651466; cv=none; b=D5xXw9yj/tGcfs+JOFPUVQ8YL5u8Mkm8pJsi1mVTHlghz6nhpAnmbRJH9s47eJH/aQjZodqZSlCWwo5ElZ5RIMAjtxsxrDZoHWfil8nGQDa5s9vecdzPYv6lxdD83WUk6GQQWDXtkutnHDZtdELaEo5/5/ZOQfE5BeJeBG7+Bz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752651466; c=relaxed/simple;
	bh=yGP6R1fUpqjMKaOhGv9QgOWRpk5/gFx/qaZbVqUJ1nE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etZHz3b4bDVrwndH4PpzYegidlQW0xQ8UIKrr/HLoMIIYvzeRX57dMTE2AZuJhFpt3kqD3eIvrvtlO1202fdyYubFqzwJMxGMu21u2G4B64JKUpPJ+fu2yDkXBpsVEqsFqTR6VScIziSiKSi7MDynZNwQ7E7hV/SJKtlMhjkiKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnym7igX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F68C4CEF0;
	Wed, 16 Jul 2025 07:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752651466;
	bh=yGP6R1fUpqjMKaOhGv9QgOWRpk5/gFx/qaZbVqUJ1nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qnym7igXoqGrtlNDLg6WqxZ+RhchA59gIBwhtKVvib30Yb/OSbr+TFQb/Ox9tjLA/
	 age6eD1B7/telUP+Gc40pFntE+7GTyNCKlosmvawWQf9QHcg59kyZF5C1Wm8oUFZYr
	 L/nTPFVDcrJ2rNUvKNEqhnEcRUKFjE/mHBRNHyAjyeljUcyaXp2z0TKd9sIHujfyY9
	 XzOF7VA/O8DxgmMx9Wa4xLqQXYw9NH8wmFRsgjQwK2ZBTaaoZxG9IMfZzLwz/HaI8m
	 svQI9NaYncSBL5DdidjWbiNs3s+7slZe4RoZBxps1ire0yYcmn7O+A9YTw3D/dLQq8
	 tq0ASGKthk50A==
Date: Wed, 16 Jul 2025 09:37:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	kernel@oss.qualcomm.com, Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/9] dt-bindings: pinctrl:
 qcom,sc7280-lpass-lpi-pinctrl: Document the clock property
Message-ID: <20250716-fancy-aloof-hedgehog-50302f@krzk-bin>
References: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
 <20250715180050.3920019-3-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715180050.3920019-3-quic_pkumpatl@quicinc.com>

On Tue, Jul 15, 2025 at 11:30:43PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Document the clock property in sc7280 LPASS LPI pinctrl node.
> Clock settings required for Audioreach solution, ensuring
> proper initialization and synchronization of the LPASS LPI
> hardware.

I really wanted to see here documentation explaining the change from the
hardware point of view - why hardware was working fine without the
clocks so far? Or maybe it wasn't working at all? Something changed?
Where the clocks always there in the hardware/firmware or not?

Best regards,
Krzysztof


