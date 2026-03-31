Return-Path: <linux-gpio+bounces-34460-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOALEZKHy2kuIwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34460-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 10:36:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7BB3663F0
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 10:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A966F3023819
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 08:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448863E3C60;
	Tue, 31 Mar 2026 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+mjZTkM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA733E3142
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946175; cv=pass; b=OqPdT9M/FnpZGgVGyXLXACaf7FQyGHEQ4IXDoZ0tnBgX9CBgbCX+6/tVHzPBbEJ3kzrMjGNiJ0uawlDwuWlcZ1IIHV4zOStlxOBKIhnjA04lW+D5msl5fQe0DF8NGq9+PGmItixMRyLDwi6STmMDY93k8Xfqby8Dkj8KTzdAU20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946175; c=relaxed/simple;
	bh=XVn2QcmjcQjFkVK1YggfjpxaDDncirg+Y3RdNmPE/+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qf3HvpMYl4L2In4klygXINCbygTaHtzUynJYPQ+ntzWjDV8OqjiyrasqBmIT6rjXvbep6D6+Hk1xKo9cqvkAO1Ginj10Mi1Qmy1U++jQBiDkDE+o4oIwHXSakRqYoGUXFkHlcBdptkGEvoIXlLOJgvlBtFzN1rARBqw8XMX3NSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+mjZTkM; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9c04152730so20114566b.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 01:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774946172; cv=none;
        d=google.com; s=arc-20240605;
        b=hXP2TkOOvCkGPNuAE1x3wmDelrNRc0EGYeVj9yIbjkY6srISO3GgUc2phmh1wubXqe
         kZdG5Hm+mtLysjXncsHdp2cD0bSrZjU2vo9jsbSPy0CNqiIQyuaMhkYUa8VS8VBAHssC
         A1TZ+t8NYLRTLvXHXmceRTzjq57a8uHu+lp+DLM39uS3GMUYmgwFDtkHO5MEh+MjlnXB
         EKshrMUPPOcH+/h4OGtcq01dU1slKNzWsCNDl/UEOTD6nkNDaQlvBpUflLq3RycXQ1xk
         iVePsupLLijXjM5M2TEYGRN0BN0UQYwypfGgdGCi32JPCl0npkknmZ09zydA3uu09eye
         Mp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        fh=SXpuw9ofGQS7FgUmXU29aqNcq2DksKA1+/KHcdp0Qss=;
        b=Lu2aBYJjtiVTPULExhfCkZZbmvCIKQKJ706GAznzsdR0KHaWIbDNdypTkN/KhSMqtv
         5WlgEsxE2RlQqqKfqXVps6R+GIGZeVw5mylaV64xXps2KVCdLya1uo8Ru2SweQ7hOpNa
         fd3nBLUiwT23lU5cgVt2J1KjO6kG96dT8LoCMVbHMuU/J0k8oE4+k8d8ohMCp2Vcqn+D
         W2ds6uVe3QvAFcrNCS//XozASpwt+DdoNa2zKsmrHUqSNKlq7+AoFZ5Z796SpfTQLHt8
         lPfwNPyLVkNq97i7KngKZWjBdx8XgW5KzvTsJ5mts/gZBNz1559rETi3w6bqNyaELQMA
         WNiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774946172; x=1775550972; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        b=L+mjZTkMhikoveXVS1doON1iA1D3e19kfJZdouvzvYjjCPs/Ox04vxuqTbHSBKdSmV
         ijzCACmhOB8z87E+xJGzEsmDKjEmXyZpcjBDQu20B+9pmLPVkF3yGnXCMv2iT4yM0+rl
         UisC10rV3oTOuBJjPJkEKe8C2wrlXqN5ZWuoeaeag8EleBfREB/CfMh9tbMsQEQzV9Oq
         2Zmm3ciexDl+gwr6RCPdgTmPgLplOkSvhRb1pYOpi7ylQOEmqHPU9cpxeutJkskX3aVw
         we7CjQ6vN46t+XJp/YOMcWWwMk5ZCF6RUK7UUq8UhLrCQ7yk+AFwH/kQCnElpUKajMdW
         JLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946172; x=1775550972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        b=WSUVLwY87OPLfszhwknLVFqbivZTvSeDTimSxU6TKaK50w0uNclLs4bSv8ksK9xfa/
         FGSUlb3caLdbk+10SABDs+hvOtOFtAxqCjtMFYVkffddUQpM78wvckiINv8AyPvHW/Aa
         qWQDGW41Kyno0NRLQ/csOxT0tcY/Yjz2Fn8rRA6AZNXE/8PKoQLUb0VjZvr7MLwn7sys
         PFm3WiGXnIWI1DBc1toj37qG7lX5b1bBBi8oOWS2L3NhKIOStHxW61/l0FNYOGmbhcTK
         VXInt4Le4Z+hpkiG7eEFQWCA91lh5IQfxLnNIr7KXWSDAbKCIT34EqlNiahf76hD+kJ/
         emmA==
X-Forwarded-Encrypted: i=1; AJvYcCVYxsMyJJhgP30LdYi0QebqD4waG+NlAU94pg6TZu8F+KvVo1C9SzB5s2yGuugeJM0ngROMBai7F/6b@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2e0Ct9+mb5IcvZgEPKEgx/h9a9JQ7xOqpl+bjYIk5+uOizIe
	F2fUKKUjFKctEKL5J2AOoEJcVsl170CZpTIe3Rz7NhnbTt01C2UpBkOtCMgduQjHjkUCCoU1thX
	svH9OiG+NG1g0SRwWAF5PQN/8xxN89n0=
X-Gm-Gg: ATEYQzytcCltic9+ULPwsv8ezW1NF7fXparF0DOi+G7zL2mXcSvOL4l0efBg5vnr2Nq
	ZnESHWJynbo9dfXIQdRiZOWEMDG3tAkvj7obsxHzFeM5qOm2Gao6L+jRBXVZ8GtyozitBeJfQpP
	z5r+0f7dmZmbgyHQvL7C4cK0SusE1m+/HXsRcIFY/03GBTkZcm3rBt3lF5SjFI4NWGdjlAHdyPR
	lnOJ9sMLwYzOVFFKqEcEu3tAqKBVMd2LgRKvuZrxJIBUxNr/uvy9JswGjbRcfXzt9f9MINDDCM5
	DshgaQ==
X-Received: by 2002:a17:907:da7:b0:b9b:fa57:d5b2 with SMTP id
 a640c23a62f3a-b9bfa57d98amr71812766b.42.1774946171488; Tue, 31 Mar 2026
 01:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330083429.359819-1-l.scorcia@gmail.com> <20260330083429.359819-2-l.scorcia@gmail.com>
 <20260331-flawless-bronze-lorikeet-59a6ff@quoll>
In-Reply-To: <20260331-flawless-bronze-lorikeet-59a6ff@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 31 Mar 2026 10:36:00 +0200
X-Gm-Features: AQROBzCHGHvki3QPtgYv0FgcoeVoJGVuIm0WEFEat61ZeqaJ2itNlZb_JB2hAws
Message-ID: <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34460-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,packett.cool,kernel.org,mediatek.com,collabora.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2E7BB3663F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > -    required:
> > -      - compatible
>
> Not really, this affects existing ABI and might make the child schema
> being applied. Basically regulators node can be anything now.
>
> This is definitely not a binding we want. The syntax for parent schema
> when listing only compatibles is requiring this compatible. You cannot
> have here whatever empty node.

Hi, it felt quite strange to me too, but that's what I thought you
meant with your previous suggestion [1].
To keep the required attribute I would be happy to reintroduce the
compatible here, in the regulator schema and the pmic dtsi.

Before I do that and resubmit, could you please help me understand
what you meant before?

Thank you!

[1] https://lists.infradead.org/pipermail/linux-mediatek/2026-March/105060.html
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

