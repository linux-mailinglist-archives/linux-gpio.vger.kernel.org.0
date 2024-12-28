Return-Path: <linux-gpio+bounces-14331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030B9FD9C5
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 11:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17FE51883FC6
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979B913C3D6;
	Sat, 28 Dec 2024 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vg9u5KZD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF235952;
	Sat, 28 Dec 2024 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735380593; cv=none; b=EKWsoOa6qUn4uJFlG6QvDFp7KMijNLiFEdmKY/BAQcJnOc3HzlXHmqaumFnj59gTeWlH0GRN6oXvub29SGtwMaKRrCe2uRIvVL7vMlO8EJ7iBZ90nU0npt7IdwTnej2Bh1tju3kapodrtP6w6k12ckeHuLe7T37vLI4ur6NNGHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735380593; c=relaxed/simple;
	bh=mHJL8kWhPBXy26q8Xad6nrhF3LwdbM4ibHYxMwBQX2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVxfTuRrNlFBOJIr5dDyL5Uy5r69c5nQ6t5gVJJ0t0U02B13nwVWviUZ5A/iWB9D9mlto37vl+P36JZPtsezIuwpYKaROaHiA8DvSf2cFTHqnRs24iC4MRvlFRrcBEEh3crrdL4KRA4/6wIlh3yzKkx14RQUuUD8NGuTh4tStJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vg9u5KZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1548CC4CECD;
	Sat, 28 Dec 2024 10:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735380592;
	bh=mHJL8kWhPBXy26q8Xad6nrhF3LwdbM4ibHYxMwBQX2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vg9u5KZDPBTlKPGqXbRr0nNOtXUtXZ1twbCapIVSPWR9JSmQo2qVrIpxhh/sKLGfM
	 TWG4Wi105aFGAxyW8IkFzAPzlHngYUU93elUGdcY5vt629zO32zIYhLE/dfoht9BQd
	 mL0EyYchZDatJ9gt5tMS5CfDnJK8/Fqmm4dzV3SvpR5I74ZqIKo3L9U4rsoG62GLJh
	 4wn8X4MXQccTGi5Hh64ElB+QrK6UYlVHsn9RnM4qo4MP2+peLXsBi1fAZx3xxggpog
	 VUXfxl1eevokqSJulJPi3smIQTt7jzQbPhbKiMwP1HkLGbYubWF3qYF8k3nY7l3Ziv
	 soUqPphVRocpw==
Date: Sat, 28 Dec 2024 11:09:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, quic_varada@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH v3 2/6] dt-bindings: clock: qcom: gcc-ipq5424: add spi4
 clocks
Message-ID: <gouyqo3dtlbwc2ipm5edxpnrfjsgojzqoyrccjflkiwwfkdpfo@mdja2sovtnxr>
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
 <20241227072446.2545148-3-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241227072446.2545148-3-quic_mmanikan@quicinc.com>

On Fri, Dec 27, 2024 at 12:54:42PM +0530, Manikanta Mylavarapu wrote:
> SPI protocol runs on serial engine 4. Hence we need to
> rename the spi0 clocks to spi4 clocks.


No, you do not need. Why spi0 is incorrect?

>=20
> However, renaming spi0 to spi4 will result in the following
> compilation error's.
> drivers/clk/qcom/gcc-ipq5424.c:2865:3: error: =E2=80=98GCC_QUPV3_SPI0_CLK=
=E2=80=99
> undeclared here
> drivers/clk/qcom/gcc-ipq5424.c:2866:3: error: =E2=80=98GCC_QUPV3_SPI0_CLK=
_SRC=E2=80=99
> undeclared here

Then do not rename... Sorry, but that part makes no sense. You must keep
ABI, so that's why you add new clocks.


>=20
> To add spi4 clocks without compilation error's, do not
> rename the spi0 clocks. Instead, duplicate the spi0 clock
> macros and rename them to spi4.
>=20
> After switching to spi4 clocks in the gcc-ipq5424 driver,
> remove the spi0 clock macros.

No. ABI.


Best regards,
Krzysztof


