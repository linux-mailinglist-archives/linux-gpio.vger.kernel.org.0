Return-Path: <linux-gpio+bounces-34471-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNbJKyShy2kUJwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34471-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 12:25:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5131D367E3F
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 12:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5985E30E401A
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 10:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C386C3E0C66;
	Tue, 31 Mar 2026 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e5BZFsRn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070C23A9634
	for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952116; cv=pass; b=k0jIQf0Dg9lIQZ2a96H3eD0Z9Kom9Zya32kqXXseMpsJmmNKSLasRPJZ0a/bvaxViY4JPB3W/RpvpoZZlX+OL2QRwq9VU5OXNiPFyDMpN289j8b5S2VrmvZ0NXSMHGK74NL8Abt3BLiBmS6Hdr+XSPVCxOQiHm46EwiBN5laa7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952116; c=relaxed/simple;
	bh=+BfKSKWqlI1AALMWRDnBgfbKxVWZIsKfVTDoY9LW9As=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQ1kYfqXQHEm+0Hx8xgojK55Vr2dEaShWtdL6U4fJtAR3tOuA8gOCUElWGVUa5gujC+FtfZ8sMMuH0r7yCHumJV7MnNaVzc85mWjOocekfDQgzuzCHdIFo6WyJHJ/+km4jZJ984VIrayutbVUVpkaOyQI+H+1J32oGxK06Chypo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e5BZFsRn; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2b636b944so1695238e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 03:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774952113; cv=none;
        d=google.com; s=arc-20240605;
        b=HFbrwLk+DUvhpWQ5NCX6HeR7/02TfOK2+nVULbLwjih9AuJLjchBqudiw/SE1FmUqs
         Xa5TTBEpHJYJ8PWwv+fWIMoWyf/m/CYKoZc5Vv4zcZg3HgtyOnWS85AAgs0WZNYfH8oN
         Byu3vACP4vRJqG46TRdxBQ9DNyWj14ft8t4p0IvxNSgBxVlFOllBP4CdvEs/FBXWmOr4
         SGYiw3d7J8/i5FFbdjWeZY8a9ZcIRzp2MFt+4VUKsdy0tWhIKU6k19iSZL34LTpbVt/8
         H8Yb11X9thkcyhu8LBamN6fXCvQp8yb4tDsS0A/b4Nw2YOc1DbFxZKSZIo5PU1QrLK7I
         vacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        fh=8pg8dbqEhyMUG5nUJmAQ4aiAaQDq8EawmRProPUN7ss=;
        b=bKNUHMD+1NdIu70UT0AJ0T7sA+L5wsNoMz+TBVu/9KgsPnTpY0P64Ggbuybc/K/in8
         /fnyuwROs2Kbiil55oAZAvIDp6fb1B1fOfTQGZ4iu6g3IEna2FvlfOWZrsjgNuH9LTQ6
         L8P9NTuAg814JFkdiZvy2cjeWLitwQFxammavWYuaJK1ZEsuNV36xiZUpX0TDIL+v4Yq
         tUK7dQXPa2uhi08LmP6yn6zRNZ8dJLul0x/K7Ks2fhqeiMlKfDPkRuawlBkxEFQ6KhkU
         SipO6FWkDb+J4og3oD4HCKZbP8V7HlC/p6SOpLK2Nd1tmLvGhURkjtCe9IZ1u0IARlv6
         XsLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774952113; x=1775556913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        b=e5BZFsRn/cfpSycQzHhx6SgKcDUhEghskKFh5tjggHr+u1Q5FSqdzgqusYEcSCjvQ4
         exY5t/ZwDAOFgB1YJN5OD0uSazh0rbi1aaNP/EzL2I5FVQPPaHYlBt+YICa2lHtBJrzo
         sufMri1ejYJf8oRnZWnESOlRSYZcHIZ8UGZrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952113; x=1775556913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        b=A5R/dPmRjRzGYaegDm30eRGRcsYk+YvVLDvwlubsKUpcaSOfPdi2EmtmQdzVLkiv+/
         1v99GFcqcYqH2zWDdsasf3u5HSPYRQv+bialr3ZKTWe2CrUSfJx++gxzbJvrheVOKdi/
         kHbdujHaSGA/1MIzmhzgYHAQvBeYh+WnSA3Ef/eElsRJ8vW2vGkZcN12Fc3oLSlscaJN
         c5wRXPgjWUa41Am+cvCuTDx4h2KcqakGgCT3oYGboz7IEy7tetYhLzEdNEl1/Q6DJO8T
         cdxBgL4IPL+8XVQW6oHDcvr8rv0mVG4pK2GkN6PwRDLXeRLLzLvy4J8ScBtRkEFGNXjA
         mzEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8dKHYrmENjNYaq6RKNZcEN1LDXzN7FVdBRgHsYg/GVnO1wu9Vn8NknRdwvyxfGRCacWw0vrQCi2MH@vger.kernel.org
X-Gm-Message-State: AOJu0YyCd9Avxrzjo73xC+1fM9I+/wLZpqRLN2kH66JOoqpyS7K894rv
	oZTBh6mBDQ9DJo+R58JnZBdtse2qwhC4O6jbY4Bq2djAQJFGkCOEmARNPA/H4smZNYzjggbF9KK
	m75quo4viD4nq2UaEpK2VaW6I5uTrmW1QsEe12U7Z
X-Gm-Gg: ATEYQzx/Ui84S5SV1VYf1Tf+GBLR5UXjvmZHcgx7bnJel1Wx7DpLkUMY/58yyJfPKXU
	fasdpG9CdqsYSbRYDQqiIgBFV4jpqika0gIlSki3Gy0l63a5QPrn4Yve89ocNlxkuVdy48AlXkn
	UohySj6CsWsObouURmA+foW5lyIg68NMIX2RQB8TY5rKGeAVs7Ewi98TRIaU5f5e6P9Nie2tx0k
	2JGTRqkPYySBiNPWn8VqN4OfS7anP0aGhCF/tuqfHJzdsNrm0sU3K8gI+V4EwpiPndBqB5aP0sf
	08k3y/0Zo0mkt5MoYqjV2vxs/ofn4SLo5cCJVA==
X-Received: by 2002:a05:6512:10d1:b0:5a2:a5f6:dfce with SMTP id
 2adb3069b0e04-5a2ab7ea285mr5687077e87.11.1774952111900; Tue, 31 Mar 2026
 03:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330083429.359819-1-l.scorcia@gmail.com> <20260330083429.359819-2-l.scorcia@gmail.com>
 <20260331-flawless-bronze-lorikeet-59a6ff@quoll> <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
In-Reply-To: <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 31 Mar 2026 18:15:00 +0800
X-Gm-Features: AQROBzCSfOwC7PpxPWsVcV8RwypXUnG7y9-g_GLDlmzGCrhYIDEBqda8qgwR7SE
Message-ID: <CAGXv+5F2nMwftF4JvXLuJr8Oz9VSoB1f1qq9mPcMYegmJ6BP_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org, 
	Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34471-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,gmail.com,packett.cool,mediatek.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:url,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim]
X-Rspamd-Queue-Id: 5131D367E3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 4:36=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> > > -    required:
> > > -      - compatible
> >
> > Not really, this affects existing ABI and might make the child schema
> > being applied. Basically regulators node can be anything now.
> >
> > This is definitely not a binding we want. The syntax for parent schema
> > when listing only compatibles is requiring this compatible. You cannot
> > have here whatever empty node.
>
> Hi, it felt quite strange to me too, but that's what I thought you
> meant with your previous suggestion [1].
> To keep the required attribute I would be happy to reintroduce the
> compatible here, in the regulator schema and the pmic dtsi.
>
> Before I do that and resubmit, could you please help me understand
> what you meant before?

I think the point is that compatibles for regulator sub-nodes on MFDs
is no longer accepted.

Instead if you want to have a separate binding for the regulator part,
you would need to reference the binding directly.

Say the binding is at bindings/regulator/mt6392.yaml, in this patch
you would have something after the "additionalProperties: false" like:

allOf:
  - if:
      properties:
        "compatible":
          contains:
            const: mediatek,mt6392
    then:
      properties:
        regulators:
          $ref: /schemas/regulator/mt6392.yaml
    else:
      properties:
        regulators:
          required:
            - compatible

And drop the "required: - compatible" part from the common regulator
node bits of the binding.


ChenYu

> Thank you!
>
> [1] https://lists.infradead.org/pipermail/linux-mediatek/2026-March/10506=
0.html
> --
> Luca Leonardo Scorcia
> l.scorcia@gmail.com
>

