Return-Path: <linux-gpio+bounces-39022-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id STEgOLJCPmr0CAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39022-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:13:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D46CB990
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:13:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Cx0DSStc;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39022-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39022-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD86C3039A0C
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45523E5ED7;
	Fri, 26 Jun 2026 09:13:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC5C3E51C6
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:13:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465189; cv=pass; b=gb24isQ3TuqrfiCkUKl3v+oQQ3FK0wUSw4Bqu9S87j498i7dzBtX2VHOuDwUzGrPxHlHc0J8PwDaHHLrfdgD0a3Uoy2WmnmVCY4+VhajMtRLMEuE/td7zGLS+/+6fkq/loLKwr129kbHUvMkiJarH8GxypYcYe5UQuF2fDZ5p3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465189; c=relaxed/simple;
	bh=KbbQR1i7C5wmzlWEzAQ1sdnBYsBTwBeB+CufbfTPiYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdfzkhqM3d0GC+n2x0eSQiosjdvY9jz3oZ/MC9knwXzJzG32ab+2yvdihLwl/a89lUfKa1WTblilnqB/Gdd4PPap4K1hQSnGeknuYN++mepNGHxgqzuosZyRaDy+ZaCDUkEs402JBb7QkBlLELjhIteh7Lf5JuDaKbGQVA9x6cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx0DSStc; arc=pass smtp.client-ip=209.85.208.48
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6978f1eeb87so1236030a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 02:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782465187; cv=none;
        d=google.com; s=arc-20260327;
        b=iNzr7tLZIQ6VLtmD39x7bI3NkQuXGJRr8tmJfqjwCaDd8A6Mz0r+3iQDpALzJgMqcU
         qSkFLwN5XIInTWFj/0k7FDneAwK/PR4HAQPTzBySyyARSwqsWJM3qZGqCStUR4ofUMuy
         y5H/cvFKpwhV7u+4VZP67Z3lqDH1zSz5zB+lCTwsd5kS3hl8cKIcKHYnkXG7C04b4kTs
         dEi8OfO8zl9v3n2BGS67FRDFO5g9PHNGBNZSm2Kgq6xRwTwoKmNcywyI0hh2mtVWZdMu
         nXYCRlCIJlbR/YpsEN+zPmA4pAJl0w9Dgi3YSKy5sdEI+GTWTQ+86SwtNz9ZlMPlchv5
         koUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        fh=0NePws63sJ68B4g9wwB1Kg1ypvBDe2luMMS5O2kWcEY=;
        b=Wu8iChFDttlb9OH9nAQS1HNS6Ju43ZMNjDel8he6EMYSmVOI2nB/drb2XN5zif2dAq
         gmpBfha89qhMeU5wFe4sRonQv6B7GrUTVqznX5XCgZt+WrwW1Rt7xcDCycxClZBf8V0Y
         KLdYsb02+uz58bFRWq28Qlc/XFaLPgH6IhiAvajxe+CWT+KvtVtMaSTjtaz5UpyNCgzI
         ISERtex3+g8hwMCgBAo4rFmhCnWyxU4OyIgUPhi+crQ3eR9s5AZmdXOuGFqZbmKTn/MI
         g9P+UaivE3JRvS3vuC7RFaczgDt8XmO5epxJ14bDBnYlY0bS8yWM0wRD0+zk570c5sVq
         J4oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465187; x=1783069987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        b=Cx0DSStcLxM8pohUvHSL0GNo8GrjeB4FcwQqIPrLRRrb9s0rP9U3UlHCAcYcEZwLAl
         qOndO8Fhdaxxs4Tfqty/YVodDxXSXakDnDJGbE8XxT9fFzjocJIN7xxBLpFTjIScIjFc
         Swfz+LF24xZXlciA8qdtXYHTv73R/VJeTWG4e4tGd/lXqVNEioJeLTCF4DeSzacuBos1
         lq2e0HFLIHdQghgFyYrdrVViwK7SD5wzCp57ThnvLxmELNE6tEA9kPdqIredpZQIKp4P
         bfeO9q8tdVKtVKd1BEi+EqG8c/vfzvy99fIE7ZonvkJg0qv7Qssy6TRR9TVAHQNNSLB8
         ei3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465187; x=1783069987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        b=UACu5ckaizwJMVzuto/fb+S8vUejAmF7CZY5FRNIc18qyD7xg/4kVyNrA4V2qv0tEM
         JLSSKN5yIrTEiVrX1rHwwivHXOjYPxBtz2og8RX2t37rZdKFj89b1T17PU/BH2cNF8MN
         DWexcDnTu2YrwGmw/RsBwnIWbmuMP8+5jnVco7oMUwM2isvS5YEbcxOtrY8MQbRzetnl
         Xqj8MV4++sFtpP2Zw5VkYo7BDJiKScc0QWu2z2S3FEcN+kY8cXtTIcwQrkCrQStR6f5i
         2kOqFFnURUrfWaY8RoVJFnotganOzIRySn9Cn+O1TR0M2GsOFxvcE6T+oSiiATLsfSJI
         d7Zw==
X-Forwarded-Encrypted: i=1; AHgh+RqlIeSVggKhlxqeQ07URmMXOrKlC8SOGxTIfWAA57znGs8M8vXqzRtEHAeGkcftkyhAwm1qee76wZTH@vger.kernel.org
X-Gm-Message-State: AOJu0YyjX/9n73uMf+a07RKK4Z8Zq4MmUW3/vphdxzqJKSWMPCvnS8Jk
	W/NTc9+9AEufApYgWqdk/+22Fku1O1su2aAsQT8rb43OWJDBOydqmGVAjy0yDL/Bb9XPBuYTbGT
	b7kZ92XqVQRqQNjn1+CHduFrjb7v5+ehxMYxl
X-Gm-Gg: AfdE7ckiS20Jt9wkiSU0hD57CY6EQchFqu9QoBUjAwa/wxmZyh9lOou/KZzbRnn8EA+
	hjWX/GNTARL6tUjj5Le6iyt4yDCjJrSiuTbrrBQr8/gX26WJ22NfjTUZXRf4tlXTIc7lMkiPXMC
	nwyARicKFGJG7R0+w1Y2dEW3SE1+PmN1Baw3M0j06Aps2uiH69Atjn4lr5j5rIFB5UOIR+3lMk9
	3XskpjmMy2EDjNzgqL1f6NQV+yjqQeSDXFAySbnhdEQftUidwvS3YcTBbNLdsrowVgf6b0=
X-Received: by 2002:a05:6402:190b:b0:697:c0f6:394c with SMTP id
 4fb4d7f45d1cf-69810a44a6dmr1504110a12.9.1782465186628; Fri, 26 Jun 2026
 02:13:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625104742.113803-1-l.scorcia@gmail.com> <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud> <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
 <20260625-unearth-suffering-e2c59d39da0f@spud>
In-Reply-To: <20260625-unearth-suffering-e2c59d39da0f@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 26 Jun 2026 11:12:55 +0200
X-Gm-Features: AVVi8CdLNvDTFf3GfQHOzooYBWEAR15rw8FIdBZyi6PI5TChocrGHW_idD11qis
Message-ID: <CAORyz2L5YuBifG-ud7QHPva+_nyL_SyXMVQ5EeC0s52isc5J3w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39022-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 670D46CB990

> Usually when making ABI changes because something was inaccurate (but
> not wrong to the point that it didn't work at all) it's possible to
> support both new and old ABIs at the same time because of new properties
> etc. This is a difficult one because it's using the same properties in
> different ways. A new compatible would definitely be required for a
> genuine fresh start while retaining kernel support for the old mechanism
> in this case.

All things considered, the cleanest solution seems to be adding a new
compatible, mark the old one as deprecated and also try to fix the old
driver code. I'll try to do that before submitting again.
Thank you for your help!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

