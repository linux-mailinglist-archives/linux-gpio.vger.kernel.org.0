Return-Path: <linux-gpio+bounces-27626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA4C0BF70
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 07:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DD39E4EF49E
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 06:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731982DC769;
	Mon, 27 Oct 2025 06:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HMYxW7K1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA322DCBEC;
	Mon, 27 Oct 2025 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761546595; cv=none; b=fX9HhZo5P+x3kF9n6ZCrH7drNto/GYb0J7dWyNbo7J0hqsdOLEpt9UVltqcidBfja27SwyMFIU+LtGsFrHX2tkX4F+ftqjUqgl3/5BCdrEXU+hciWgekroxbUjoW0Zge/tV3i9g0Ggp4ghOgJfulWekwT3yGSi/PX9Up8jFHt3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761546595; c=relaxed/simple;
	bh=TdHs17FCyQ4ZdqPfCSDJQPxIie4Xyq5TrVgSkDsD5sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nM2Is2jIAjBrOOEuo+DYplSjfc54B0Aqn/fIwPod72LA9fT05+qT6gZzE3bigDgs+7XwtbAoEyT/rgaLjf2on/Dc/8oIfRsZ5CM/3ZlQnggHD06jDceiAxRV0Qtnt0mlXwoP6wdzKpWqGJlMlhPKMQWl/u5WgbpV+PhvSazT7PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HMYxW7K1; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/bX5F5xtEl5d39K3d9CgLwrGY9rdl9Y127nalKUfOTU=;
	b=HMYxW7K1civenPxJy14W7xwGdcC01AN+8+6ViFs732vcVokhpVxD2aNjdl/k+t
	BZiXnccihpRHrb60ShXkzHf+MmBgdcOI6rr8i+OSG20DE/bKZTD7CEYJVHaKeeKA
	ycIEkh4G2E3bNWouXeSw80MLraW2MOidX//yoWRYZ5IPc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgB3BhBCEf9ocla6AA--.4897S3;
	Mon, 27 Oct 2025 14:29:24 +0800 (CST)
Date: Mon, 27 Oct 2025 14:29:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 9/9] arm64: dts: ls1046a-qds: describe the two
 on-board SFP+ cages
Message-ID: <aP8RQstpxwbNQ5CU@dragon>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
 <20251014155358.3885805-10-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014155358.3885805-10-ioana.ciornei@nxp.com>
X-CM-TRANSID:M88vCgB3BhBCEf9ocla6AA--.4897S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2LZ2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQRv1Gj-EURvggAA3x

On Tue, Oct 14, 2025 at 06:53:58PM +0300, Ioana Ciornei wrote:
> Describe the two SFP+ cages present on the LS1046AQDS board and their
> associated I2C buses and GPIO lines.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Applied, thanks!


