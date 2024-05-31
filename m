Return-Path: <linux-gpio+bounces-7021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE108D67D3
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 19:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 519B41C26686
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 17:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85DB17622F;
	Fri, 31 May 2024 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo/Km3lf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695A6156242;
	Fri, 31 May 2024 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717175507; cv=none; b=QPh0vy79NWKd5fDcTDC+RLzhHnUNQCFwfl/QmwyID3WzekBOhUC3RhDL+H6X1d+LW0rmqF/gp07HNA4UWc6I6lqQ6bcVkkqF82CNuRjPLi2p4eDjNdU10yDEDveM+HSJlks3Tcir86lrLaE4eP21r6wsyoYw/UaQawKuEr3ehTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717175507; c=relaxed/simple;
	bh=vRrWMkAH52qDz5UNk2YwCTMMtgaG+6xrdICh2iBUvB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jW4QzghW2RGx8DBdXYxLmqaAAz4GVvPuur22lLog357KjrFs93inmKxrcb9TApqzc6OEYki2SG5pMLh+ZM1ElxUCGQ8NrRj4hq9yJH9uKnSwyXEkJz3eoNtLzoxdn+HsR5A4lKKjQcsEBAiQOb04kpXgt3simfsDhMFEm9mjpig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo/Km3lf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6879BC116B1;
	Fri, 31 May 2024 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717175505;
	bh=vRrWMkAH52qDz5UNk2YwCTMMtgaG+6xrdICh2iBUvB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eo/Km3lfp/YbMP24tlquap/WYes+4pmLbjMt1DCaobPomWQIcBKGa/348vdbiA8n2
	 aeftrm68i0G5DLe7mDjB+xO2ZSlOCxzZpZJXamCKxx7VeVnuAyUe5kWryoHMby094m
	 oTB7tTxwI833iszxH6NGjlNmbhbb7h5AORzJ+xgZGQFagrYHMDZHtaIWSHw24PjXVI
	 XuUtqlmwP84AABhJdxRJy0xhP8cQ9GlMxNiON7f6m+GA8Oy08y0i7YxhdheqRkGa6m
	 bfuLdh+/Zs2/ctRCY0ylirQkoPJ0UxyB9RaBBdeMT82JU5554AzB5NoUU90vZAJDiA
	 i71ErVtcPFMgw==
Date: Fri, 31 May 2024 18:11:39 +0100
From: Lee Jones <lee@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 00/14] arm64: dts: qcom: sc8280xp-x13s: enable pm8008
 camera pmic
Message-ID: <20240531171139.GD1204315@google.com>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529162958.18081-1-johan+linaro@kernel.org>

On Wed, 29 May 2024, Johan Hovold wrote:

> The Qualcomm PM8008 PMIC is a so called QPNP PMIC with seven LDO
> regulators, a temperature alarm block and two GPIO pins (which are also
> used for interrupt signalling and reset).

I don't see any issues with the MFD commits.

When you submit this, would you do me a favour and change the subject
lines to match that of the subsystem.  I usually silently change them,
but this is a large set and it'll become annoying real quick.

`git log --oneline -- <subsystem>` is your friend.

Thanks.

-- 
Lee Jones [李琼斯]

