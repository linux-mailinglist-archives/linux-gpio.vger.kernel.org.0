Return-Path: <linux-gpio+bounces-34383-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC6INA4pymnX5gUAu9opvQ
	(envelope-from <linux-gpio+bounces-34383-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:41:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80535690B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E385F300E3D4
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 07:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D073A16B0;
	Mon, 30 Mar 2026 07:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltGT/++V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E398927442
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856366; cv=pass; b=jbzhc1O+5fdWPabGWyVkyFL0XM17R6tDHJT47ha9H9iLG4AFL9ZPgCJk9qT71B29UhNrImZX1dj8Jg2fF1mlSJI6CgpuZ2JMvZO9RtgZ7iy1QFLE9Jb6D3x1N2f0qMh3McE04zRQlU9ywIZbsPnH2TmPLVXNtW7HdPp8cwn+VdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856366; c=relaxed/simple;
	bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkI0Z6KhQXNYLXdKI+Iz5sWbb5jbkwMJtydkaGsTCi9BiwHy/sPwLBDWlZ/EIkBj67hCos/r1Z8JvX8SOq9nq0J6FpwgngpyC5LtgkL/gJhbiKVBGgknQSv4SYoZZpPFH/rbydabK+uWBpsbsdM7Zco7PE3hnTQ8kVVCzbsWR1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltGT/++V; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8d7f22d405so639406666b.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 00:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774856363; cv=none;
        d=google.com; s=arc-20240605;
        b=Apt7Z+bxkUDszDCIJbudUlf95yNdiI/Cz8M1dOkVppkogHDVGcmqsxqbh96WtEuM6v
         3i8FnFsCUowNwwBqvoHvu61WF66P0z+jNqShWohn+lWxqFF2P90VZSAT5vPiJDNSSby7
         fqdsJS8z1433AnQwqNrCxePeQDUtV1ypgN3J3dJFagUjE8YfJfTZN6phkUEnQCC2Wrdg
         0dV/US7X1lIvzOYRGR0hEoGO/b6/hpzXF4K1F+djDcB83fKtOqLiktI7FY35ETQREX3a
         Fbum6UPtkjvXBP2jDzjGmpRUHtCbWQY1gdpYcw7zCTKCJb6Fj9vuWlUTP9usgiWeZWnl
         lXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        fh=xuo9tG5QXAx0Xag+qQw8s/3nkDIJulSDMJsFWF0K2Gg=;
        b=MpTW6chQvvBlmTxfpBiAlfe1/MyfXuXzMVInaggPpeeo4IxXlqBoMYsRY9iQvziuLJ
         ZXgoJtyg5s/Tg/5dVHnMGmCgyvB8tyEn1idMMGBTZIV5bhQ//cFMEPt9QxhBO03NCldh
         UNSVa4eMX+C2pVrvatug2M1ahv7TI2mkXbHhguctH/ABeA4eC9lo6Au1cO41ud0yenR6
         u2YdNdk36oPI7yViXlFMmHxi9UBKhicnWK869ZvhDXQ9+JaNcP7ivOlgHqMeH4ufGe07
         7CkogECqcAVt5MvOl9aoEbatOC4lFI3oRxeAFFJDo8Q+86ZQiKIC/B0r5gnzxGo0ti7F
         JO0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856363; x=1775461163; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        b=ltGT/++Vw0wLROzvE0ZJl7pTg3Cu8NEOafpbs0pE8r3RpE8q0sJpAfXfzjUWl2eKao
         CwibCxdmVAMROEpagKD2P2BeipXDsZxOnJFg4r0p1SI3Yxt3GNT45BOnZwwLk95Eo4Ur
         bic/mmzzsS430V9YyHZrF1oEuD07CcJd9k5Xpfei4bC7LfoMpiFCPtea52XCLajH1NFL
         w0y8A5r8REZkulM0KoCdY+PSvUpt12E0BymdQDrtioO5gbl3BEQKOToNLoa4Q24RP4EU
         migiCy+shBWDS5wRco4kXyBXokQ/DvrpRXnXp/N/8qO1ZGQyZXYdOlwrIUfNsxc9mpWJ
         iQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856363; x=1775461163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYnQOFZ4bGFIeTmozNqeJkBObILJLvK0jBuil+gfMNk=;
        b=gvxnolpTdcrXihczR7EoKFe/DS3W/X/ohwICmaJOnAtqRv83aY/iCiO24CmBNQOIP1
         Y9ib2sJSVpsTVdmxGcBP8vDx7lFP+jSAW/L4jISyjMaTLdUd2v7geHzXzLgrrswjSOzU
         dNmf0mDph1YRM910/lR43Z0qkpwU3B3w9kxeAWD0LVOdbxQRGqzHMVS6YPvoosBtw6Kp
         adq0v8L85ESX7IF0510D3Ksg1e1rVC5ZQSx8DhqsukY525QT6D5zlqdLRmKbx0cujnhK
         EtXp2TLJu2tXTDeREprebh1yPROFcIVkODMaB5OG6nXsn7GRYDDgYeIeOOg1SADQROSh
         9HEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhf91m+Ru4w6cerGOoOgQYi/yf9cW2JyaXiWHesdvl52kw5k/h7kKoG5iGu/Ojbk05IE9MJftVNSEv@vger.kernel.org
X-Gm-Message-State: AOJu0YxiudOdRRWwQ23eG2DmmFhUgaqKdyD+O6sPBHKI8UUQxdd0GyNK
	knyhGpPP9/N3lTWXb7dWPDcgFbgo0useqVrro1JsvbdPYKvadgrXFk6dZ5WTv9xNwNEcuY50UOi
	Z9zZTdfAeoQxKoDMbK/P9UndMrIguYMg=
X-Gm-Gg: ATEYQzybpxt9hhbl4cWsFQIIUf89WRvncPNY1sLCscGo402Nm95GVn5640DmL/pN04Y
	S9IocdBo80tErSNsbShz7up597zzNjnsr+OusJWbxcqtvQt6iSuICxjjWNF7pv72GAfn8CKIDFN
	t0LZTT5Z9tZPFSAw1bSNDRvTOYiGk8V4u4vZduF58m3pSbvVT4EenpU83ej5Q3qC57S4QuxPq14
	h3j2yryvKHgmF2W9xGlIszD099utO+9aKsCDhkudReC9bOgjLX6aTXoOEkqC/pU4PXVXQbVQ11c
	vB8WZA==
X-Received: by 2002:a17:907:9621:b0:b98:13a:c92e with SMTP id
 a640c23a62f3a-b9b502b5aa6mr732407066b.2.1774856362950; Mon, 30 Mar 2026
 00:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-8-l.scorcia@gmail.com>
 <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com>
In-Reply-To: <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 30 Mar 2026 09:39:11 +0200
X-Gm-Features: AQROBzCKAAw0QfB5IMl3n57JlPRQDr7IJq4vT7zpNh4df3HsPMVBkVCKdEdIBnw
Message-ID: <CAORyz2J355NZH=7iQ9sTDBhAmtjP7xTpXe21_3Z9J_R5YvdXAQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34383-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8A80535690B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il giorno gio 19 mar 2026 alle ore 06:04 Chen-Yu Tsai
<wenst@chromium.org> ha scritto:

> If this PMIC is anything like the MT6358, then it has 0.01V fine
> tuning for most if not all the LDOs. It is sometimes needed as
> a rail may have a 0.04V boost that would otherwise be invisible
> to the system. And then if you have something like 3.04V set in
> the DT constraints, you end up with something the regulator driver
> doesn't support, but the hardware does.
>
> Please see how it's done in the MT6358 driver. I spent a lot of
> time on that driver to make it actually support the full range
> of voltages, and describing the supplies.
>

I had a good look at the datasheet (MT6392 PMIC Datasheet v1.0 08 Dec.
2016) and unfortunately I did not see any fine tuning option in there.
I'm sure this data sheet is not perfect as it's missing some regulator
registers that are clearly used in the Android sources, but there's no
mention of fine tuning in that code either. I guess it does not have
that capability.

I will shortly submit v4 that hopefully addresses the rest of the comments.

Thanks for your help!
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

