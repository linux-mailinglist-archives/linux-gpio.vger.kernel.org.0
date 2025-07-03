Return-Path: <linux-gpio+bounces-22742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25CAF7EE7
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 19:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2B1F1770A4
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 17:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000E82F2354;
	Thu,  3 Jul 2025 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/bejGgx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1F225A2AE;
	Thu,  3 Jul 2025 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751563909; cv=none; b=C+RThI9Cw2J+Of5/ENMJlk67Go8f4N6JRNw5QDNV1hKK8MRFv0MY0WGprLg0mA6ovUP0fbmuGYcVEJ2pgpN1lubjVAoJOpZLPjKUp/Z5tLQFPI8AJxi3Q3hsu+MfEz5fDAtCNjWPNafpwuqM0bfHAw/f64QBdiP6/bToqZKk9jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751563909; c=relaxed/simple;
	bh=/miH8vjD0slJjdpUyXvwFaK+/jf7B8gLX6GgcQS7ajQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNYSou42K3k24WPcE8fyKeQxAXNwPLRBYno2KQM8sdTzluqTGU6RIkNC92P9jhL26+E6scrX3Hb9meidHRDDw1bZGEFW0dfZ0tdYtv74d3Mf4paeMoM+Igh/xeCZ4jjUMYBWrpTaK0UtMoDQhD9MVgiOylK5nLVgMxMPQ8GZZZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/bejGgx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D29BC4CEED;
	Thu,  3 Jul 2025 17:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751563909;
	bh=/miH8vjD0slJjdpUyXvwFaK+/jf7B8gLX6GgcQS7ajQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/bejGgxVCVYOuC3Bj3MegI475+JdNha9KDPoOisNhykirBeOEKbL/silo9mTsxEu
	 0BHFbYrL4koMJ0Zg5l/l4JQTyQS/B/YT5ay6MZHNhkWKaCu+5Sv56qHA1IV7IHuM/z
	 Z8YPkP5ZKOrF7SarVeUWvnT1np7CQCLRPWu4wuBnGG+t535WqcMrgg/qvwRd+y7ZpY
	 yYYoBz6YsbwaT0+buNm9QZA6sD6/9HFvGRyyci9wSglxv0ustqj8lcDnnqh9nHah7H
	 qMSCHEAteLRy/svcll3DrP2vwj4XmZO92t8Xgy5W0qf8V91eQLmvkCCIkCmR/RTzYN
	 uD5Jn/C2j919g==
Date: Thu, 3 Jul 2025 12:31:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Luca Weiss <luca.weiss@fairphone.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Milos Top
 Level Mode Multiplexer
Message-ID: <3d3g2sq4r7pruu4c2sl2itclx7xuja6inasaicm67t4sx6u5fl@xq5g7h4rabno>
References: <20250702-sm7635-pinctrl-v2-0-c138624b9924@fairphone.com>
 <20250702-sm7635-pinctrl-v2-1-c138624b9924@fairphone.com>
 <20250703-daring-burgundy-limpet-a1c97e@krzk-bin>
 <DB293G0PC5P8.13IW22M6DDESM@fairphone.com>
 <a453bd90-b7c7-42eb-b769-b4c87b6dac12@oss.qualcomm.com>
 <424285fb-14a0-452b-8d18-6165d2a78497@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <424285fb-14a0-452b-8d18-6165d2a78497@kernel.org>

On Thu, Jul 03, 2025 at 01:26:11PM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2025 12:04, Konrad Dybcio wrote:
> > 
> > 
> > On 03-Jul-25 09:44, Luca Weiss wrote:
> >> On Thu Jul 3, 2025 at 9:41 AM CEST, Krzysztof Kozlowski wrote:
> >>> On Wed, Jul 02, 2025 at 05:56:16PM +0200, Luca Weiss wrote:
> >>>> Document the Top Level Mode Multiplexer on the Milos Platform.
> >>>
> >>> What is Milos platform? Does it have some sort of model number how we
> >>> usually expect? Wasn't this SM7325 or similar?
> >>>

Milos is the actual name of the SoC.

> >>> The problem with such new naming that it awfully sounds like family
> >>> names, so just expand the name and explain it.
> >>
> >> Please go argue with Bjorn/Konrad about this, wasn't my idea.
> >>
> >> https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
> >> https://lore.kernel.org/linux-arm-msm/b98d305b-247f-415b-8675-50d073452feb@oss.qualcomm.com/
> > 
> > Milos is the "real-est" name of this silicon. All the associated
> > S[AM]|QC[MS]s are just variations of it, with different fusing.
> > 
> > You'll stumble upon it across e.g. firmware build strings, as
> > well as in any documentation pieces.
> > 
> > There are various internal reasons for the switch, but the most
> > obvious external-facing one is not to have the user buy a devkit
> > and wonder whether they should use QCS9100 or QCS9075 DTB, and
> > why there's zero drivers code for these magic numbers (they
> > include SA8775P). We can simply point them to "codename" and
> > all C code will refer to it as well.
> 
> These are different SoCs, optionally with different firmware, so they
> cannot use the same top-level compatible chain. I hope you did not
> propose that.
> 

No they are not different SoCs, and that's the problem with the current
naming scheme.

> For me list like "qcs9100, sa8775p" is clear enough, but if you want
> "qcs9100, koala-bear" or "brown-bear, koala-bear" it is fine as well.
> You just cannot use koala-bear for all of them.
> 

It looks "clear enough", but it's wrong. The problem is that sa8775p,
qca9100, and qcs9075 are the "same" hardware and firmware.

The difference between sa8775p and qcs9100 is the reserved-memory map,
the difference between qcs9100 and qcs9075 is one IP block being status
= "okay" vs "disabled", due to fuses.

It's exactly the same problem we first saw in QRB5165, but we let the
problem explode. Now we use the names sc7280, sm7325, qcm6490, and
qcs6490 for the same SoC.

Using the SoC's actual name here will remove the need for playing games
with DT includes etc to try to map things to the current naming scheme.


The one case that isn't being taking care of such naming is when there
are differences in the firmware. But as can be seen in the "sc7280"
familiy, those software differences doesn't align with the chosen names.
And even within a given SoC, with a (overall) given firmware, the
reserved-memory map ends up differing.


So, the name of the SoC in this patch is "Milos". We already have ways
of dealing with firmware and/or hardware variations within one SoC, we
should use them (and refine them as necessary), rather than pretending
that something like SM7325 will define those properties.

I don't have any concerns with your request of mentioning SM7325 in the
commit messages, for now...

Regards,
Bjorn

> 
> Best regards,
> Krzysztof

