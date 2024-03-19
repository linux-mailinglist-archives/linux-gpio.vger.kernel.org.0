Return-Path: <linux-gpio+bounces-4452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF4C87FC83
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Mar 2024 12:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A98A1F22CD8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Mar 2024 11:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA207E564;
	Tue, 19 Mar 2024 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="iCvMuUOK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D271B1CD13
	for <linux-gpio@vger.kernel.org>; Tue, 19 Mar 2024 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710846359; cv=none; b=Ye3ptCfeToYZT+v95Pim/w2Bz4SxqfC1/JI/vbw7+6jz9bucIn0dYzudW2DxdcJGyVd3IoFwbV635Y6raDAY1sM14MYD8BJsmHJaJ3XCnnzwOSnAKAAnNz5JxA/Osfi6nFrmXwlgmWaB2PZCRDNXI7GbUdAOsY74nvOUdVKhmIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710846359; c=relaxed/simple;
	bh=iAN2vBmPvQbFWtQLtbEAaM0U+MnuCTu6AqUKsRjR6Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cy31+MUZbr3DUaipX+D3E7WaLIJ5CqoFgOxcB0QnDqEfTaHodiR0Q2hGAljSWgeev0FiJNr8LTti+BbJ3lfKicOUAp2k5ftd85kYFC2h73f5bFlK1b1BNVh5lOLx8mUFFdb3BHDU1RdXOpKk9DYddvFV+jpME6isc2uX1R/alkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=iCvMuUOK; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stdin.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iAN2vBmPvQbFWtQLtbEAaM0U+MnuCTu6AqUKsRjR6Qo=; b=iCvMuUOKxB0J77mbV91mIfEttk
	oooa7ObI45O3Un5Z2/6Pml0hgYO8mgpqSTGXkpDGebs1GzbQ89X+mYIev/QRbodUnArMhIB0sa+qh
	l76OZgQ1leDcnDuPFU2W2dDd/usuCUGFhvEbn0XkScmwC1sFjjvtOdpo3VECg0JjXWkU=;
X-Preliminary-Spam-Score: -2.5 (--)
Received: from [10.42.0.16] (helo=login.tika.stderr.nl)
	by tika.stderr.nl with smtp (Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1rmXHv-000ntS-2T;
	Tue, 19 Mar 2024 12:05:48 +0100
Received: (nullmailer pid 241466 invoked by uid 2001);
	Tue, 19 Mar 2024 11:05:47 -0000
Date: Tue, 19 Mar 2024 12:05:47 +0100
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, Haojian Zhuang <haojian.zhuang@linaro.org>
Subject: Re: pinctrl: single: Cannot disable bias - PIN_CONFIG_BIAS_DISABLE
 not handled
Message-ID: <Zflxi8SCzzouP9zW@login.tika.stderr.nl>
Mail-Followup-To: Matthijs Kooijman <matthijs@stdin.nl>,
	Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>
References: <Zd8hYYDvvk2Q-GcG@login.tika.stderr.nl>
 <20240229073211.GB5299@atomide.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fZx3L+ano7jogRcX"
Content-Disposition: inline
In-Reply-To: <20240229073211.GB5299@atomide.com>
X-PGP-Fingerprint: E7D0 C6A7 5BEE 6D84 D638  F60A 3798 AF15 A156 5658
X-PGP-Key: http://www.stderr.nl/static/files/gpg_pubkey.asc


--fZx3L+ano7jogRcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tony,

> > An obvious fix for this would be to lift the handling for
> > PIN_CONFIG_BIAS_DISABLE out of the inner loop, running that instead of
> > the inner loop in that case.
>
> Maybe post a suggested patch for Haojian to look at?

I've created a patch (will send in a followup) to do exactly this.

I've compile-tested it but have not been able to runtime test it (I
managed to compile and run a mainline kernel for the BBB, but ran into
problems setting up the bias control devicetree). For now, I'll just
leave the patch here for review, maybe I'll find some time also runtime
test it in the future (but likely not).

Gr.

Matthijs

--fZx3L+ano7jogRcX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMyF3AetYrDfGJ9el6ZMxy91tJYwFAmX5cYgACgkQ6ZMxy91t
JYyB1xAA1Jxwmh4iJYO8ZqtIKpTzuPxwR3V/Xy7WLXX0QlAovvB79B3J/4angjAP
u/7+7SgYEZrS6HRXjSnTW//L8X853dtfz0LI3TjblLvYd8Xc9mj1hBfSmmEdPU0T
rZBoITXIQFd4+RqaJ38nxWOOiOotwX5Zjr2WIfQ0QHkJISOFtYmRqk9Abx/Oh1b8
7rrMxZgGFNJ+C05heCZwffiA2UV6J8GETZ9LQjjTbG7rUU6jEUrryX6IaDuzzZjX
OuSV/q6xudzGUeL/n5m4dWWxZLFpcdnI1H4BVovWZ7GL9rm5/VTmwEKLKNdwAblC
MhGHaHDe//GZmJ8HgivbVzZoN0RBUCncqIZSnUuvCTCVzU4mnRNa7SDBBpnOO1rQ
I8Ab0NfIP4kxRl98MnI6ZXw/NvqMt/xDyswMOgOdPAo/uIiqc/Nneuiwh3NhpLWh
vJnrvQj34ywNuGSzy1BdYZlrSq1G5z8hJFKi2Ej9PAAxELPrG/wno9+cx1rbOCB/
Cz9d7S2/2Izheoh9Wtnvynzs0tgxwsqJ5Q0K3NK55yWjTdZpMZ4v3QMsByEektSF
XDOGBD1L6ZNAsD5CX8k1tIw1FFGWa1P0GmHvHMVg7Kh+8xNyf8HrY0Tcg/LGYhY5
gENQrxDywi6tdL+PAZf/2zb7aCjoCy0fzeCYzXiJ86xLk4ZxSAY=
=Unjn
-----END PGP SIGNATURE-----

--fZx3L+ano7jogRcX--

