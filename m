Return-Path: <linux-gpio+bounces-33572-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB90KS8ruGnhZgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33572-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 17:09:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C429D161
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 17:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 529203047DD6
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 16:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78133CCFCA;
	Mon, 16 Mar 2026 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRvR8jWP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540093CCFA0
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676868; cv=pass; b=lUBpdnN+4NB85a3KYOoDwBp9P+YulTbTNA/B6L2IOzM1x0vCx1YfU8V7AerFDMVLZN9E9Nfq0sB7oNjIjpuN1evsxFEa7hMg18Z+kLL+Tfz9R6ROr5VtYTBRXAzHMwqF0yYVOxCV70OewZvucBoJbhDewIV59r9M9ZOQj9GKcXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676868; c=relaxed/simple;
	bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqNfOL+YuMLhmquxHKHWYgnC697zOGkUo6zEQtz09NE0KnavB9N5GhcAt5CYxEDuVzz4Ej+qmrEfyFqE/0ZAvgWMH4vz0sw6p2fAjxHrC6PL6WBe0A4miYc6UipcZXMyGv6IjJ6Rzn0PF58P+zvWCRLU3UJErrZtoMhToqaeb9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tRvR8jWP; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6653b589a78so2140300a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773676866; cv=none;
        d=google.com; s=arc-20240605;
        b=MnjgW384NYsRWGBlRoRaayWAtvpDnstOjINkB/BOfWKNwdVHhnjg4vX7LFXb1gn1GW
         KTLQvmrqY9/7eyTjq5PadzW69XWki6g+++NfH6P6bqRmhaKOu2XIYvNF7AiqEtNchge5
         7v//U8Y2ownAaPRIEIIofuF2HVQ8OdDJVKFN/1wKnv0S5SWIH5BpNrj4P1uXXzngQBLC
         FvLnfWhkpfHTus7hOPo4J1FnIhQHxjxM6znTxiIO0FPIIKR0CNlnQrxfd/mF4WHU4Q/K
         i+cKllkfwsx6Mf1ZfTrCILBSIssoQpKvCXoGX+SDm/gQh2H3qXS5hy3I6PYVuI5Krwne
         0qeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        fh=kUZdT1zHC+66TKzGjmVTiHWG/Qu7OXHf2VC24iYDu14=;
        b=Ie1nIUBL8QKjk6mq1Kh7KUZWa8L4n/hetXQobNlsAhP5byx86ucgSOemXUCSjte9fy
         e4mZ2zdyzc9mI22BHPYEINcn8wmW6G8Y46sq0zMncOxVU7ck40XOlRlUcE5ciJTsNK5g
         hK8IZ1pdoLnWt4vqLx3B9KRKirzKfKdYQTxJ2aRAM2wUJfAyUeoeYXgeZ9VRQfKvHo+S
         6mjtYaPDPb6oy5rjEdHVP1R08oyAKSttSTwMreIP/6XFhZC/AchrnDls+4DfpoJvEsUt
         X5Rud9TmVuUs326pRKH/0IeLr50ttRpYJem/DdP2iIEdfjGF8IBYFG2eVI9S6h2EU9qJ
         5icg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773676866; x=1774281666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        b=tRvR8jWPdYpapywuFbFHAwdbkmfciAm97lupRo23Lz95ol4WDw47KF+V049m3ECDKP
         khDfrPMN6aR/vimprZmLRF6GU2CkUGsd4Jv5xtJGU+u1yNjoX+Yy544KdjdWYeVUqwvP
         PAuT67hKYlEjtdFL0MRqVeSCfe5qhhfNz5y8pDlti3aC5sbdN5iYW7S3kFsgmreBC4CN
         qAGJEDXXCt/WGvWjeZrLQIJq7Yect+cT6Mb1tiyLaxvjXE+m/ds4hH8ov+Y8sMqZNrSm
         SWPoHKrCT3TVDDSq/C0ySD3PoMmRqSWtUYuAZVCOsx/LSb4q+nVLCCHHlStxxvaawLlT
         Ym6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676866; x=1774281666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        b=GOCHUQ2Y2ndwRHiyRVDUF82Cs30X4TiHbXM2P58O9mnTCaOBvp3fLGXj3sG8UzTh8C
         XKoOTuR3B8hMUam67KJ4QSFmMk3PRbgLbs4Vs9CqLGCWWC9ZJxGrgj2MHp27UpPXKeNQ
         F+z6Q0fjZScNwBTsQaelH5fpgRqmA1f/XW0R/iT57NIxZIFiCD0yQBD7ns/NK9WXzo0Q
         o+CAA7L9pkqkOjJricIIyboUalwduqEeO/x/jSKdiY96cW7CRcghwPJvLxWviWLV2qls
         7r1R3dZqYmtdC3FGt9YxbucWJ0rlKAmmeWAeRZ6Y2lJabCaX8GO7vjwVyx/fcZpKzt2N
         KnHA==
X-Forwarded-Encrypted: i=1; AJvYcCXu8Ks7p6cFqX+W/bqc1n3lTP/S8EBBqvSYk7PVLxujyEciPWf7KHwf+yFaL3a3TyxwMo6Sd3JgFhNT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8YcArrkeL48jyAHX5y2w1eQadtUo4r+j1D1WebI1/6wK4lQ9m
	hnFiOuTisYRIkMJVxynG9uGwMoG6ZLpXPShKtCTXxYb3f+/4mVzPq6+pPPylxbs2DMc3NCsVmN2
	cssaX8lN+BFyiXgWU+2kJtVsAc8uZjqv3MehJf+kvTw==
X-Gm-Gg: ATEYQzykYSkpH2gLzX1LJZtZMn9JzJ/M+jMBLsH+QZYPurNfCFmEnRpwvyhBD/p2Buj
	TtdEQn2ElbUVlM7hj+xKm7GEN0hMQIWYhzdxD4oMnen+XPz1wl6vK5obqfw/kqwi1zsYJzUMorH
	BgFz+IoQO+XQ+dpopaxBfgZ2VmxXoEbc56MJMutULcDgDW7C71XvCZVx9Zfbc6bAdqDQ6KdJ+Oz
	rE+SkvMoi2xWV6uppIIRwJZXnBPXJlj+BEkl+JrkXrCoBgEr1ghQNRTOUOV5mYvzHlwLOv+fvq3
	+AT4jb87peOqX2T6qT3YeU+LzAbCrt3OI0uDgN95UA==
X-Received: by 2002:a05:6402:51c9:b0:65c:2af1:b7e2 with SMTP id
 4fb4d7f45d1cf-663bac17dcamr7423927a12.27.1773676865593; Mon, 16 Mar 2026
 09:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com> <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
In-Reply-To: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 16 Mar 2026 10:00:53 -0600
X-Gm-Features: AaiRm52a6xRhLIv8WCDX8JG5wzLTI5tmdCIrfHWi7mJRzbOdI91SV43T2PYw5ig
Message-ID: <CANLsYkyd8x29kz1u2dkyn_5hhWVJehz6VVKEx81Ew6i1nKObwg@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33572-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,lwn.net,pengutronix.de,foss.st.com,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 201C429D161
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[Adding Andrew Lunn]

On Mon, 16 Mar 2026 at 08:23, Linus Walleij <linusw@kernel.org> wrote:
>
> Hi Shenwei,
>
> On Fri, Mar 13, 2026 at 8:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.co=
m> wrote:
>
> > Support the remote devices on the remote processor via the RPMSG bus on
> > i.MX platform.
>
> I think v12 looks pretty good, if Arnaud gives his ACK on this patch
> series I think it's ripe for merge.

Please wait until Andrew and I have provided our RBs before merging.

>
> Yours,
> Linus Walleij

