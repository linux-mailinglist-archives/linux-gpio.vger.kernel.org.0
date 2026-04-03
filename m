Return-Path: <linux-gpio+bounces-34641-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFuuDzK8z2mj0AYAu9opvQ
	(envelope-from <linux-gpio+bounces-34641-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:10:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D51D939456A
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D6A43014A03
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 13:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7EF38C41C;
	Fri,  3 Apr 2026 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLL4LNr+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6AB368263
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775221807; cv=pass; b=ESlmifHiYh+VQVYh5HAz9Ab9Fmp9z92hV/Ot9uMJpZSzOVLpg0SzEGpDg/h0XS9Bz0/kH8e3pniy4L+dxjKSPn9WxOPzRXma/VEqboXxovHAxCkjMFNVvXT3SxeMjsW37PROuhTUXwF4MEYDbUQF15/xol5OX1MEFbylfBQnstc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775221807; c=relaxed/simple;
	bh=fNEU4FguK0fr0Zka1yft1P+c90L4GnHX85K30ex4H2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/Cg/frBwgRsKtBGOUfVYvbipGQzCPE4focDSkTDVhjd6h4zSIrrL4alSFExTuV3YiMEZ08JaDNtpyf6Oq9NOvChQ40zdu09mxM7FNhd02g6LafIlhemJdb4LuSsxwxk9slJEziql0r6QOHUbSqtPdLCekZngbxZ/ozyAHRDtGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qLL4LNr+; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6501418152cso1865360d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 06:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775221806; cv=none;
        d=google.com; s=arc-20240605;
        b=g53lc/F/bX85z2tYxPPss6h8j8yGADH/hc0U4VYzEbO4VLZXPImdEBhD+kO5lW4dxz
         GpyjYHiyqWPyb5HdrBJbV9a9EXH3Raogc9uQIBIg6FNgDn/5/HNTuhlxm/sqY5bGc/fY
         JVerOAdgcgo7Dw+v5KRdMwk1AxxqA/ph2yxOsypdYFE0vw0Vl3t7z9xQkJ/SFstreXM6
         lqyPRo+J8KuWbpArnHc9pfvuNoNO8aul9KAA9LYFYpR87lDkd6OXChUFF29neMnd/a3e
         AGmbyisjuiEZeT0+nD4hVA+krA/ZXJKUndMq9yd+0EyTlMUprhREdCBsW5g3T/zWnQkh
         yzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fNEU4FguK0fr0Zka1yft1P+c90L4GnHX85K30ex4H2o=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=B5PaSJQtnAxbiLedVbeWB1e5JEg1qKregUWOVgMzvazdiV6IDw+BMGijemD8UO2lQ0
         1Pe1lyIL5JwZChaG8HBfMLrmfQqnOr4iyf4CQCBDwi5XRZwfJGlTn1AcI3JBqBRLhItK
         HAEvvfQH+wFHUqpgjJbe687yn9Wb6KOW37T2F93yl79LBONiH0JGkgymmxkha9jbPUL8
         ayNbTh0XuRSt038cWLok2UVHlpsn9jAbQSNjcf5uUKqbzmtUkX7psyv2mYi6oWkXFSxD
         K9TxjV0qUIYYtZHOpYR1gDXZ2ddBtHYuvOGBXsQiC1YYcct/Q/zIvn9UGgOqlKbOqoDm
         YVnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775221806; x=1775826606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNEU4FguK0fr0Zka1yft1P+c90L4GnHX85K30ex4H2o=;
        b=qLL4LNr+matZGwU4fSkbjsHxGoWpIhk+atKextGeebzSZTonEq8q8d7GOIVvqITFXo
         takkeg9NbmhN+sef/pfVFJCmxEjrpw/E1TknmP0fk3bkwDFqD5GUo/RzserlZ7ltnLL/
         DEqRKL9J6QiNjs1r8D/r+IRgR3yvl/MigHVszMJxxLw1qA8trbnNbgllteNhJcoKdYgO
         25NqabcaaAwB+qYxuhXMExKUzMxMp5KWCFtzwET4KpttxK/9hcSqetJm6/ao3JG11DXP
         Ba2HgxEIvZ5lnFgJ7WsEIomJLFcWgRV6Y0CPWM2DxOuawl58fC+urhUx46CGOSCCiF5Z
         d3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775221806; x=1775826606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fNEU4FguK0fr0Zka1yft1P+c90L4GnHX85K30ex4H2o=;
        b=F+kf6dfEvJwKu+LvaOXpsNIthwNXb3ems7C9zN3HXDmCaoLZRPCl0RH+Sv/szMgW4A
         HWreSVAzMxKFUaMblHLuYDaR6eU48Apr2uBGoaKFb4kwpFh7b+ZqI5d1NdL/bYqrUeR/
         SzdOhD/gnf/49Be81Fxds4eKTsbJUCj5v+SybpDtVahal1LAbw+AwfD04MwrfkTBQlGu
         QBYzaha8UdfgtEfx4GiqflAuUzGKjiVJuCd/te50Gz5W2hQ7n4QW3DAR0rqy5yKhmQxP
         KAwvGIHdAcGR8PrvjeAENQ02o3UAWWQmBHsTup4GFWNfd1KVyvm/M4MJIeSS5nIyWJok
         K/RQ==
X-Gm-Message-State: AOJu0Yxzz1b7edg3tl0dkUAA5XlQoyJGfutKAIH+XYzwLeQIM2dZwGKP
	YNYmeNdTDniSmG+aPvokoYeignXnWovLIvceRbpoVabNd80fhwlPNQTBIcmfPr1SqGkQGexhzvD
	x8Kji0Cu3KDBvhHQOcjTs2GbKXjXYcK4=
X-Gm-Gg: AeBDietBxF0pS+5Q3hQw4l2La0Vx8fBETnvOKf+x8MT/mxCCj/GpIy80uMHHyxMzHli
	LpD1yzWncwbR2+9Wy2NGg3armrNs0mtJjhnFfXvaY10FyUdqzw3LBDwXqs/t23rv+qRA11Tr1Sk
	zU6O6Emn/NWaLBtEv63M0bBbMOj3l3zvUET+kb9+v6aye2d7x27Q1c8odF07j9rGbSJlGjO36pT
	1IdNWG01TYkYE5jQAZOvcC94v5OzqQ9GVmz7aLxskZGXmRdW0qQ03n6Jv8W/FkjeEKbDnoJNQyy
	VSl1sl3OL+6zor6d91zAKjpilIO9ShaLL77XcwLA
X-Received: by 2002:a05:690e:1595:20b0:650:1b79:9a14 with SMTP id
 956f58d0204a3-650486f3fc8mr1944347d50.13.1775221805142; Fri, 03 Apr 2026
 06:10:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402230315.6501-1-vfazio@gmail.com> <CAMRc=MeNW6XKhGG==qF5LHBQXpr18NVD26JXXTWNL57na4KExQ@mail.gmail.com>
In-Reply-To: <CAMRc=MeNW6XKhGG==qF5LHBQXpr18NVD26JXXTWNL57na4KExQ@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Fri, 3 Apr 2026 08:09:52 -0500
X-Gm-Features: AQROBzDKoLou6uOYmfaWdoiRpzI1OneR1Q01jvvTs3DXJ-w65q31hGevtVPctZA
Message-ID: <CAOrEah7Z1NJzrz0n=X39GZ8bh3nnF7kf3GgsEr+bPnrj2F7-4g@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: allow closing Chip multiple times
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34641-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D51D939456A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026 at 4:06=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> Would you mind just elaborating on what these common semantics are in
> the commit message for python noobs like myself? :)

Will do

