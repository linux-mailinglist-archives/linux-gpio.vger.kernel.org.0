Return-Path: <linux-gpio+bounces-37769-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Na0LCbdHWpsfQkAu9opvQ
	(envelope-from <linux-gpio+bounces-37769-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 21:27:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E21A6249F9
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 21:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5A17300A101
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 19:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D80380FE6;
	Mon,  1 Jun 2026 19:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/ZivhdL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8B437DAAF
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 19:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780342002; cv=pass; b=ms96m6mczI5SOQgvm/y7jWOGgQKQKP0+HK4V3zqrZE3AZz2PEgydVPkD7y5eU0vsJSP99zFvEQWmj5WsFXhOLk/tL2mzpnxfW1NXNXMvO/9yjkwCj77O+M7JjkA8skHgLpIxbBvThXlZzlNq1uJEkw0GXpey33T0IHSiUMwiiQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780342002; c=relaxed/simple;
	bh=c8pwixbD+P1YmgOGPp/si7WLAUf62AkCA7zLS95MCP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPWL6y1KqmVgl57W79DtugXp8DYiVoB2NmT3NgI4OzdVFt+4zTRGBuXI2EvXV2DllJvNIsh13zMLIgwx7V4pciWyKNTIGn3ZLpf6lJk1D1LbSiGyv2cKHJssXou6LPiR1veGWNNT9YdxEbpeb0ARYeXqD1obrfFnFO+xq2dwLf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/ZivhdL; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso5173722a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 12:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780341999; cv=none;
        d=google.com; s=arc-20240605;
        b=CstJqQjb4urDbT2oan6E1WXTe8/H+4Fojad2NiyCteoIXsWAwVUy1E2z01vHnIx7SO
         AwBRBL4HLchHwVRWrhoe1YfB/H35ZbFN5MffMHMIVS0+Of+5qSNwH17SnuGEFF8T1oUB
         dJxDjgf4AFS0qk6fWnZfGVjOoRBJu2vZn1rXvNJWoVRr/reawyyhsbnRftXrd9kEAKDE
         B0o3mJDM6veCGblgfz3OG9/Bz3JPUKhn1ePIEsQ0nsdDOrCkkuzL1J2ReaFFpA0OHYRa
         rb7zh48sulwei7v7XN87aDZtASojhjRT+Fuu96T4gwIvkrD42AaZWMxuWUz/LKpE0l7l
         4nNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        fh=JaB6483a8B81gPpbuq2DcOW3IeorPt6GVkdPcABsoeE=;
        b=RaC0wBxg5adF149vVLpH0PtHurQGkfotocPv5JEIlQcdrcPN6du12q3aO0jdGZQ/w1
         beBwnfr/cOyGZpfKuByAsS4+ApGmASz+Dop0Vf4MBokmqL/heR1+WHifOjunXDZfD5v1
         g43Z41xt86SnEQ30K8PPX8CauM2gx6s59Ut2Bu2pMca6ZABAgqsCbn036I5E4HQk0s7c
         Y8SO4aYST+kHDPZyx/VXOAQDXBwbyCekpUvICr+9cP/aXJr4kdEEdZMvd7M7csqPOQ82
         g5DSQz90ZC11uJ0Vfq+X2n3s0GMkn5l/UexzSG0fwV7F1SCPZaE10bRFNFm1N/HUp3qB
         PVwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780341999; x=1780946799; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        b=N/ZivhdLvhAYF0abe9gLGWFZOR0iKULLfAJCG9n2pls+a/G3kD2GE1thEQEcH91HUE
         Cmf2GwnD5pukUWq1Ks3RXfFrXwZfScJBwB8c9ZI0H8XOFWcW5kiaz3+JxfEea287fy5H
         epH9LUM+Vu4nZNWfb4Ur4DvZ3ShF3VGu9So7bRDwNVyvkLP+UwKzgcNkTFRnh11R+2AN
         x78rHjH4OH+wq1UkD+uLs4ETjaK0DHoZiny4uC+1rP7Byb+2WjO5uIgnY926uQhPFbma
         RiUcEg2lFBlbOj+4KDvLLu0AmqUSRh3nCK5IjQJBvIlC5e1YrLuu+LaIadHXW57SJJC8
         eSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341999; x=1780946799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        b=FpPvAHmdbsWJbs1DlAyBlpPSunP064VisVOfdno3/gx65306eNcDhGdv71vKd7AxyV
         lOWszXO4z/bP7LX/6O324dRj+Dqn7T+H9ixLucdQuqoujDZ2HaH9KfKIB0flqouul/Hk
         I956QAHYPmA9ZrEpVVxB4N/JSUDSp0/ycXxaWbTnJr+mfIyeAWk5XO608X/sl4xHI5qI
         F4XVbJKiqumS+CpMN8tH0SuzRjstYPFCHIsSqU47HRhyP+/MrO4T/5frkVa6gNXYnJlK
         UZUtL/whIFf/ANZpvYNCI3djWVOMdmj0VI61AYhbAvzdKkB9aGxydXZS9PhG9cEAXR2B
         sPmA==
X-Forwarded-Encrypted: i=1; AFNElJ+Cu2/0wiCBdWLe/fKpwmp1qR/XSQSwJTSvgV8aTG6jm+3gbcUORT8GQjJEPeO7aMRycmGZjjdykKkD@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqidSwb2BGcJKDOS0z3R3Bu4oIiQKucB5UJZOUL40h85EGg2p
	IP3xbd+9hG16Ntzy32F8oOC0EFJHolOF/pB0xxeaZeT3IK6WUP06Lz0jrQVUuyN1SN8tYnIrJO6
	yDSgOuGF3wMos+9SQDvCzGDDWN7UsUSI=
X-Gm-Gg: Acq92OHatDc/0SHWT10QxZ6LXQrTvV09SBpAekLEyQN/EQcVJoVEAGpQM/H4QLr18il
	+IbwwZ1lBQnZj1FihM4AZ08ZLsTbDVemHuimjYFgahEjk96t5KmYf9jNOIWDJNx/OIrpkjTlTMq
	z4fISdjX4SZWNcoYT8vQk5kxYH0YGUhALOcO0XmlQzkyOlJZOi0C6QdTScoTpYZgi/sHytTLu5m
	z5n+dRRsbGA44GO0mxLU1jOYtOQO9HoPBkygN3+DSttmH90GKM48ufVd8Sjvl9pvOhrnf6BV8Ha
	pP0E7a6yV96eUmmpC7W0kTdjJSdjXut1Qr9NPxhzRCgbYzQ=
X-Received: by 2002:a17:907:3c8a:b0:bed:9a4f:a42e with SMTP id
 a640c23a62f3a-bed9a4fb3fcmr364036566b.17.1780341998944; Mon, 01 Jun 2026
 12:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601152707.29039-1-l.scorcia@gmail.com> <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
In-Reply-To: <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 1 Jun 2026 21:26:26 +0200
X-Gm-Features: AVHnY4JJrihr8pVvcJ1S75wZnre1x-GIaJ8orYAbpycsIER2tWpRasMInT2GVKk
Message-ID: <CAORyz2+YG4WsS1ay2UA_S-w1UGMe=yEbiz-FUnRPYR03xaikng@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
To: Linus Walleij <linusw@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37769-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,collabora.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6E21A6249F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi!

> Do you know that value for the SoC to you can express it like
> this and translate it in the driver?

Unfortunately the data sheet I have doesn't say anything more - just
"Normal slew" or "Slower slew", and I don't have a scope to measure
it. All I know is that it flips a single bit in a configuration
register.

I found this missing property while working on the Xiaomi Mi Smart
Clock x04g (mt8167). I ported the current pinctrl driver for
mt8516/mt8167 to the paris platform driver (adding support for slew
rate and r1r0 pullups in the process) but the stock device tree sets a
slower slew rate for the speaker amp. Without this patch it would
trigger a dts error.

Thanks!
-- 
Luca

