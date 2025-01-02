Return-Path: <linux-gpio+bounces-14437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E529FFE8B
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 19:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C712C3A2119
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 18:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537AC1B6D14;
	Thu,  2 Jan 2025 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IN8jtEY2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F0C1B6CFD;
	Thu,  2 Jan 2025 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842848; cv=none; b=M+KyqicPL6F+llkLi3yxnEAX5VypPFzC5kv0I58rzM0dhe/3vcWcnkU9cgVgc4PENjLxgc153C5dIECJAwwn81J4B4ksuF0ZqxSW6JB+HaHQVirq0UruVejLDEukBMFFMTpgBCjbKrBTel26lJK7oQ0AZ0i4672lDiporE2Ufq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842848; c=relaxed/simple;
	bh=FsJ5rQbIn7wuyi3MLYhxOUbzVTt/8F48oPZrIwiUjVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fh8L13AvJ0nB/Ak5XI/dTRZAgQkkSTEtwSR++76z45FoaO2s5YVbuODJdit5KoHKhopuRaS8UDELvLrP/MJQzlW0YEDDLBpK4O+gdgkUkvKc1vhb8DBhbCF0SbopQ/KSIqfLl7ddV0SGIJqADPJPT80o89GBjHADDZdfWqGSMbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IN8jtEY2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEEDC4CED0;
	Thu,  2 Jan 2025 18:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842847;
	bh=FsJ5rQbIn7wuyi3MLYhxOUbzVTt/8F48oPZrIwiUjVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IN8jtEY24WfSTv6yrGATlfysHgrySQfwSA0n/SwaTRHiI8RQOHKgqUYqwtJRwxmI0
	 oRDktXkNhE4kRcylpkZDCYHfGYFpqRtSTjn4+jhlx2hI6ceFej5nYHV/LIVjw9Rxqy
	 3oHRbTleO2ir1YKqUmlWNFQyF7f5SYr2+qfDjeoBPo/80uRPg4JPrdi10QigJdrJPW
	 uhzTbOZNKyHfRzgPXWLyugqEizQKtKGgQ6t2NtL8S6m7/8nptQHGJAWyvPREw8RQmH
	 R6ZafrSg8ZgEzCLe8mjwsqcQ15INVQ4HfaQ3f9wTtk7x3Gi/cnwvizDG9f0bfFB1As
	 7xUvUbgorugdA==
Date: Thu, 2 Jan 2025 12:34:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: gpio: fairchild,74hc595: Document
 chip select vs. latch clock
Message-ID: <173584284481.243767.13154845131546643806.robh@kernel.org>
References: <20241224-gpio74-v2-0-bbcf14183191@posteo.net>
 <20241224-gpio74-v2-3-bbcf14183191@posteo.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241224-gpio74-v2-3-bbcf14183191@posteo.net>


On Tue, 24 Dec 2024 09:02:12 +0100, J. Neuschäfer wrote:
> 
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


