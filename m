Return-Path: <linux-gpio+bounces-25814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 432ADB4ACF2
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 13:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46EE618920A8
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FE332255C;
	Tue,  9 Sep 2025 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="HdVQZPT1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F6931C571
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757418897; cv=none; b=ZcrfkCes9AvsmL++su+b6TW03+EdqRn/hGvyPADOh5VXFLwrqbiQsHPhYCV7gI7VfDle+9lMz8NSwnGo7YvHK2DI8qdnpHEIOww03n+H/su/ADpc8JrUe7rVX+qw8Ge+5fFJ/odDcYKKvImc6cn5fHSewqVlhhPTdr+ZRzCJ9zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757418897; c=relaxed/simple;
	bh=SN3v4BDj6IFxe4p49D0eWcikdp1MC+MbA48ZuP9sTU8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GTboF+Tv9QNbLEgcjyTQrWcUzVVPhNDBVgL/RDcxTi2f7k06nqcyxTcruzca2lL1gdCrMZmgnPa6TwVl0W1z+8hkmsIHW8iaIXPj3w7kIH5pi3nYcJrXaZXhHGvzNn9dXNzKEc4ua62Wqym8TI/F4Tip2fppt1brf/Hb0lGrJEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=HdVQZPT1; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=HdVQZPT1MOoq9Iy41Z4qJXtIUrvjtKu3enIoFGQe9cijQ+b7uEwYmjDDe0j2h87QqvRxCgfSsE7IRH53eYkgWCdW4Kv3A1EXouRpLy+jcEuHFjIbUoSLdRTO61XcSsXlLOUauIL1WQAV83m3XRXc+FkGXo7/wYNp3ZTj1qEH3ZlQHqk+O5z+zAmoNHbBBf/xmf3AIYzknK5903N2QOfKXS+Sr7zoraiW0SvxldlcpylWYXPJk3eelJH4iQeAXJoImfohO65Fm+sMnSurXQbAJmRTYxdUdHseo0p8sQ8HyU9OwKOK48zrYdDyZj3Jyj9/K1fYg4p0AHWLs3dzzwqqVg==; s=purelymail2; d=purelymail.com; v=1; bh=SN3v4BDj6IFxe4p49D0eWcikdp1MC+MbA48ZuP9sTU8=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-gpio@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -713498179;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 09 Sep 2025 11:54:38 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 13:54:36 +0200
Message-Id: <DCO8ZY43WXEG.1EK23QDRO0X6C@mentallysanemainliners.org>
Cc: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 3/4] pinctrl: mediatek: Add debounce times for MT6878
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Igor Belwon" <igor.belwon@mentallysanemainliners.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "Sean Wang"
 <sean.wang@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org> <20250908-mt6878-pinctrl-support-v1-3-3fb78c8ab4e8@mentallysanemainliners.org> <493794af-a1e8-4a4e-a253-2b6b703df53b@collabora.com>
In-Reply-To: <493794af-a1e8-4a4e-a253-2b6b703df53b@collabora.com>

On Tue Sep 9, 2025 at 10:00 AM CEST, AngeloGioacchino Del Regno wrote:
> Il 08/09/25 21:17, Igor Belwon ha scritto:
>> MT6878 uses different debounce times than other SoCs. Add them to the
>> EINT driver.
>
> The only reason why I can't give you a R-b for this is that you forgot to=
 add
> your S-o-b...
>
> Cheers,
> Angelo
>

My apologies (again).
I was rebasing these changes and rewording them a bunch, probably got
lost somewhere there. I wonder why b4 didn't scream at me.
Will add.

Thanks,
Igor

