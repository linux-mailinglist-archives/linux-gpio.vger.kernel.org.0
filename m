Return-Path: <linux-gpio+bounces-38907-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lZQqBrhbPWou1wgAu9opvQ
	(envelope-from <linux-gpio+bounces-38907-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 18:47:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0536C78AA
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 18:47:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TtS6JSep;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38907-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38907-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25D17302679C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 16:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861C43EB0EE;
	Thu, 25 Jun 2026 16:47:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE09F3E556B
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 16:47:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406067; cv=pass; b=DjXHPCKfR9vysaci2qiqe21wdYOlRuZQYTwhVY18Mr3zUgH5pRxm/WMUQjkmlb27UriHNAUF27qeBkRrkUfcy4XYAPqZr4Ai1+4SwWmFDBOId5Ij1IgXM1UYIEjrayAPDHrdNZemt4g1f+sYaVkNxuvuoTmE+MRPZnuPxspMNcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406067; c=relaxed/simple;
	bh=XC8lLB2PyVdmlOd/l8+hItdF3INS1maKBGj8wCLhcWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lT4GwIpVTZdLOnY150x3LL+SNqZLkhgdzfcEgu/wkgCkLlGhHjUrQa8c+uyzH2Z7Efmh6Awn5lO3r4a0korCGUqeFO+nnzGEFTtM0CiZwBOjjKnPpFZ17EO9vj8mpm1Xm/d+DvD0Hq54YJQLg8JhtD5dRKUFBwTrvAmiz+Cynrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtS6JSep; arc=pass smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso2733053a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782406064; cv=none;
        d=google.com; s=arc-20260327;
        b=oi+Qd9LGA+j7f2Oi7E0QSUVGZH+MkH3/3Rh2/KK8Gh51s1MnUN9EgOB/YPGVWdD1Pb
         NPFLA6QYKxdabguMrbfhizC5tlSaJygnNikZ00h656EdaXY3IJwEIteT9pnkDxfkJcrq
         Gdvm/bC4H4aWjAAKwnVJYiuNs8PDJEWHrWHnHV4w9uz5+XsdaXyjOYDVAmAW9TWxDOYH
         Q/dtdvAz6NTHDKoCrRq/s9Ui3rjrbJGednVDSO/GF7/mdsTAriyGMn7CzLIJfvaEbKle
         fFN218I5b+abwA04ySCyx8Knq2134aoINnrU/zmHNt80NK5MAal8nDEJfFAHyfvoj04e
         Gj8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        fh=7lEaDgxzlcdIg8HfVEoO/jISlGYFTCtTxly6ZHeN/Ks=;
        b=gObTLwOBb29dx0wq+I+mtGxZ9n0NBHDgywSwTqEJQsocYAj3Bu0fxXeL6En3qPvHs3
         krCWZHDYIgX4vpONqM6PyacySRb1UxqkhNtbZS3A5pQE4HNmdRixeOqF7AubbyzebeUR
         7JdCOF/ixp08Fb7lIe2HpvbuAVh4VdFVXCSgfiJ2iPWClIRqtwOJTKsMDaA6+H65/+fm
         wdoo0TNUUMVC8FYSdONrviHHKNbmWNLwPUHiuvtoYbHZRlHqX8bAiR7tGNu9SKaHiGoY
         G7H6U9Sc/pZnlPfsXfRGGDwMr1sQyJZHwJ0WKwfvvTp7hDjYjsqovzYucIH0lwqgHIMF
         NbSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782406064; x=1783010864; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        b=TtS6JSepNObQGxa0F0SCFMdMY6nE9QZmYbFaodt0O3WSYWhlV3k0K+UmQLJpqgCXyl
         gIvddoLn12HQfJpYafyaXCircv6NCKlKocdj8HZvs/6mYaN8s5+cT0g71u4V7wJkqf2G
         hMGA04KJjx5Vv+SilAjW543SRuYPrxgCikjJWb+8iWjUOr/+AZXOdrKgnoX5TGpUdwh4
         JGpQMuqHVPvlwRzRLx21zjXYjNDdKw0Pdva+yRzw3+dq8POrIiE/fXx4/KsAagWLCOF/
         gcKrYwMp3ykpVhbhr1xoo35e1ClklLcehOkPwmfpckOK8yXLNxQ/HhfFMqNS3rUyXaTy
         qh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782406064; x=1783010864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        b=Bbm8yTlNteNPOJL4HGBl4cYa2em1HRmYNHEVVX/oOvnFBS/WWHaUBnz84kP0GjDLTo
         bpIlnm2vTOikwzvUXRXyUm64HStPO9S1uUUYugsmQMWUwt39avPTO+bSnh/G8+VXTCK+
         QEtiYFz5wZfj0/DIdmdvxIs8W2Pzvzj6sLJJiuoKMMbwk4O8b9e2GBafUEZs3MTyCNhT
         SqCWym+vD+gFP3ts8KhOU5JUxsS8M7tv0FOcbNmPQ2+xu4uGq/eBSS1wdWDExj5dTCIT
         wY7gUaRCM34DmRChcQoeCTaIy5BSa+1vORDBztduYEa7q6TqXLpQrDyLOCeuYC4YCFPb
         YBTA==
X-Forwarded-Encrypted: i=1; AHgh+RpL55CZFr22yaBTIzCdEoI7OcN7OuXHYodXiY8AqkoElRSt815OEbuSYNqZGT6PfB2D5PyNIIDJZtDF@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbwD0ww4B1Ljx8NU8FCQ1m5qFw17xNMdwrMqVR7Cd/ZPSi3c6
	ALh1y1DabHTpNadF+OsqMzxXPG2CMg9ek5mtY2GzBrEK83tmPl6WvM/JtNhaw6x1coP0GvzY7yN
	5uxjJCQkwhwWZrnvwLqOTYzqenHiycjrlXvhlryw=
X-Gm-Gg: AfdE7cm2QCbEkaFhMsjnPOykQfWjpnyAk+y1Zr5T9Zhu7PRNOPh7Rg5RZjqq4hXJqXb
	rAmI1UFjE5LvlfnUohQmjJXK3luFv+Pe8aAGdzHbFs+sH2XuRp+KkO+nHvbriLt7sxZbYerL39v
	ZPjlDjD4I/3WlO5Kbwswd6a8cZ/Ee03UhgzrdhcMSyrkjBALBRCU46Sim+PHeKAZF/GT9XaW0Xv
	CbZZpOAXz1viEzC5uBlLkidbebrC/iatEeDWzm0WlzJ2cJtdJWCTqbLSO/CVMHCb5RdqRet8w91
	oy2gZmBLd3hn+mjmjVhPYdB9DqHB
X-Received: by 2002:a05:6402:42c2:b0:697:b72e:b909 with SMTP id
 4fb4d7f45d1cf-69810af080fmr119797a12.28.1782406064192; Thu, 25 Jun 2026
 09:47:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625104742.113803-1-l.scorcia@gmail.com> <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud>
In-Reply-To: <20260625-cameo-siamese-cd78c349519c@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 25 Jun 2026 18:47:32 +0200
X-Gm-Features: AVVi8CdQlZ_mmiW-bTGe4tmL6GeOR-G22Cpv-MM6leLml97_0sYg9x0t3Mjq9gg
Message-ID: <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38907-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linux-mediatek@lists.infradead.org,m:sean.wang@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC0536C78AA

Hi,

> I've not done a very through analysis, but this seems like a massive ABI
> break.
> The change you're trying to make here will mean that new kernels will
> not work with older devicetrees AFAICT.

Correct, that's the reason I sent it as an RFC (I mentioned this in
the cover letter). I am new to kernel work and I'm not sure how to
deal with this change. On one hand I am almost certain now that the
upstream driver has never been used in actual devices, since the older
code was only partially merged and also, as Sashiko correctly pointed
out in [1], it had serious errors when matched against the data sheet:

Sashiko:
> Does this configuration cause a regression in pin multiplexing across the SoC?
> The legacy driver used a 4-bit shift per pin to pack 5 pins per 32-bit
> register. By passing 3 as the width here, the framework calculates mode
> offsets using 3 bits per pin. This causes pinmux writes to align with
> the wrong bits and can overwrite the configurations of adjacent pins.

Data sheet here clearly shows 3 bits per pin are used to choose the
pin function.

On the other hand I know that breaking the ABI is a big no. But what
would be an appropriate solution? Maybe duplicating the driver with a
different name, something like mediatek,mt8167-pinctrl-v2? Is there
another driver I could have a look at to learn how to approach this
problem?
Sashiko also pointed out some other minor issues with the register
maps I already fixed locally after confirming with the data sheet, but
did not provide clues about how to solve the ABI breakage.

[1] https://sashiko.dev/#/message/20260625111629.6CD701F000E9%40smtp.kernel.org

Thank you for your time!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

