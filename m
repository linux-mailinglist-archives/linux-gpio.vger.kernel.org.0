Return-Path: <linux-gpio+bounces-8289-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 991CA935292
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 22:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9F9C1C20E93
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 20:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65332144D35;
	Thu, 18 Jul 2024 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b="YvFiTAqA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947A914389A;
	Thu, 18 Jul 2024 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721336305; cv=none; b=SYBeW3jG2MMVzRumZPOYkHzACiDov/0kap/kY4siVQJpHLXOKD/xcGlM0fBw1zxXnusPINoBgmVMxgHG5mQf2tM+hR9pkBvaPQP40ruNVd78QSzRFuGoValInXjGbMZNdE3bbZW8qDbf195tO+a2h9VKCsJR/GOmsjXvT7XJ/yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721336305; c=relaxed/simple;
	bh=2LBOPGsD0Ssm1Sq4yeFLUDik9ii/DlpsfqgQD/1exLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2pDxPOKwX55FeyR1117cVsHFyzrnjJL8yOk5LIFAJ4LLD25uHZyKVsZPxMxUc4aUrzTmfaZj+6ifXRFzy0ro61y7C+gtr+w9SJP2+MRlYjhpmEvIxvA+tNKTEc6G40IERzmtiIYnCzAk2SV9YZE2tqwvU0vUloGCAhCFXyDlrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b=YvFiTAqA; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1721336295; x=1721941095; i=j.neuschaefer@gmx.net;
	bh=2LBOPGsD0Ssm1Sq4yeFLUDik9ii/DlpsfqgQD/1exLo=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YvFiTAqAoXj43jUDJz5NbdR8dm3nVAi/mDwIx3+E/IsRtjEGwm6F+xJrhJuenYHe
	 inaqm4CHyDncgJq4xLJillKaAVaEJUwFOLxwsL9VPhicQuDFU9+iDuyJVVcX6ouR1
	 FBT5CMVGyglaM22cr+K8MoGMCeAkcTfsEk15+449rmq8XmitFdCKSmKILRbXiMi4z
	 8lhN18r7Fwt3Ag0RERY+iN/dmjFBWzwbqlcYRdO6QN3VGNMzQdDqt1A9ZflQbZCrD
	 GY1ew83KS5KQEFRKyV5c+Y2PooIzmTflrCNlynHBC3RB5d/dSFPKVty4sb4ZQh40G
	 dbRHEw/AfRswaA6o+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3bWr-1sLzYy1XQR-00uTcF; Thu, 18
 Jul 2024 22:58:15 +0200
Date: Thu, 18 Jul 2024 22:58:13 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	linus.walleij@linaro.org, avifishman70@gmail.com,
	tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
	yuenn@google.com, benjaminfair@google.com,
	linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/7] pinctrl: nuvoton: npcm8xx: remove unused smb4den
 pin, group, function
Message-ID: <ZpmB5XHvEsiER6Ee@probook>
References: <20240711193749.2397471-1-tmaimon77@gmail.com>
 <20240711193749.2397471-5-tmaimon77@gmail.com>
 <ZpFrslx57m62SEsg@probook>
 <CAP6Zq1gYSiXFhtA0HAaoSLD7Lz-9nuoy-cUn+qvh0BLev_ifVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1gYSiXFhtA0HAaoSLD7Lz-9nuoy-cUn+qvh0BLev_ifVg@mail.gmail.com>
X-Provags-ID: V03:K1:NSSQMffJHv86bYx90IK9aYBaZp0OdImfBR1MyR761oZdk83gvl1
 97JAsjwirurgsJcklBoqIlEwWjhxjgCpGciu6iMnSue4KS4S5ZdVfbPHVipO+KN42DD+kNb
 wcjG78gDAKk0vy7U3Ns91JLNtYT3yC2gdnWzItnsDO8wQxOLCM3t0PJg1Msf0NKyg4wn0wv
 CTZ+FaaUW0nulIjWG9Vyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fPr0PDlDbJE=;y5zDiP4m3x2DelNKmAFMw1IQbtp
 Om4Tp2J/vZVF1j6t0wOSzXHTC+LrdWQz38j+GRW6xDUBzFToMgVJPzMF1/O5qLacmFsJ1NtuL
 P/JACF1SOY537kytQxI0otqUT47ASMzsER1szJcOvai34xPPDuWt22TAWdpTG8ZXzF7wPsDsI
 vNsgpWT6NBKuYjli905awrlfUKDbCOSNvnQgnuxtRAAwE7pJ3SaKnoQ0Iq8gzLG46D03hVUI8
 ENHFvhcbHyohLtazY9OYig0+AOp0sGVJReRjvpP3CNml0EqenZsKYRkqWe23DblAoCqyCkkXe
 mFrTAqmJdSJjnP5ErfiMK4NGVGEarPiH4sui/aiwZh7Mr81fmdAf9RG790qFD+6hngY0t8LsN
 jcifnyXT0W3KqNOQVuuv3suk6WO26BArFSBcwm9CbNiv6RKU773mnMzUxaOH1jiw6CPyKT56U
 3yPaPuHuJ1qUt0cmSOvSqZ7FXWnSbKBgW2Ym8Fx4UGpwsmIMhpagns2ade/j/eLBFwIbX+qYX
 U1OLQWKIDraqGXT5gYoV0/cor/NoHQa1sU0538iQH1T2LKQ/4d181FMKHbMWbzaArxu7TDvNN
 UAARIPcJ04j7sAg9M6gwBglHjZKrzMs3xYHkrRSUQLmqnlPKDOfYtqVQRQnu41muzVFYUgXRo
 jp7nKVjJ8u5mOEKWY/VzOOkgSDmLKfBJF+pGCE6WK+6QcJF0z1PJg+I2+6Su7qBMAGCzGKOpb
 mPzy/DYX3ihMIkS+ODrhVebvx5fM0Gv2qBrwj2ZvfTU4raSflpIHE3XNLszhnr2ZGMuMNr0it
 rc7iCrB4dYKJrTIKGVMXZAhA==
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 05:24:11PM +0300, Tomer Maimon wrote:
> Hi,
>
> It does not exist, do you suggest modifying the "unused" to "not exist"?

Yes, that would be clearer in my opinion.

Best regards,
Jonathan

