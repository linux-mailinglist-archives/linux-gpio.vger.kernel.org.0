Return-Path: <linux-gpio+bounces-34043-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAwRMkJ3wWkQTQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34043-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:24:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D0C2F9D98
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 18:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32F77311A0A1
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 17:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61A73C5542;
	Mon, 23 Mar 2026 17:07:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2941F3C457D
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285671; cv=none; b=S3WUTRhTKpboi3dfAayCnQjRdfw2ShNk39qwu2sykCdPjs/jRGR3HUX9gWE3Ao9ZPTOejYx/TtpkD3W5Iy5OjNc0EdPq2VFEVy96EuXoJVKYeXLTVxL/Z24QvRWzjwJaffeneqprZjPvajWZmIcVMS2UBOc6v82yw6XQ684tOk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285671; c=relaxed/simple;
	bh=9w/05BIl6C5UPAlKrmDSRzbmSzN+L5hTClA52vqlcgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rw16eQdpRrnJ+TFr022nblUA8tSuOE/IRMUc6gy1nEzDUx1+4qmMaskckOfkKBJ8QTWOaAWS1OfFYr+gsKah1E/yMOgB//yV+84XE0tpwNVFRSQmpn3TEN6HceczcMgv0M4OivqA2pKYiHSZeMa9RbYYJ3HksHxMakGafVR3yzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a27d39067so2851221fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285665; x=1774890465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9w/05BIl6C5UPAlKrmDSRzbmSzN+L5hTClA52vqlcgI=;
        b=UktXN2yaA/JftlKOBbSlnEYEgkkxWRn2F8S2FJneotvOy0su9TmCGVbIWqij5/ojIC
         ErBt6hpXzi4fuHV3SyhvGX0oYgBOY4OAyuCa7iH2YZblL7ytrGBy0qVJiGuHLzA/b36A
         Ey4AUrWledcebJekxOloTKVAV+UonL6+vGv/ioY7lZ2peIS1D0/VLxDkjIz2GU0kk0s9
         L/3uFDCIrFPQFwx+ivSwCnQ8wT76n9LTXnrx29uiFNxPVLzjIMa2js2h3cD+f1kBBRLb
         AuKeKLw/lwxrVP/MzB9JLayeClmzQkCDKopgB2nD6srZA5bqpOc5oLuPP/08DS5DdXAe
         o5FQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/z+9oEhRXtAA3jW8dH3pp6AUZRjJXy9kXiC3ZOfpqz3PTtY4vxxHJ6Uo67XL4wuO6oik8Dh4Upnji@vger.kernel.org
X-Gm-Message-State: AOJu0YzjYtCBN1AKTN8AUj8JxQrjDIns0S/WYKtIdyrZwxhIHmp05HOr
	bRvvydSL+PJpGoRC/9LGUdAGL1pTZnJYVKytymyJ//ZbkLCLUK1XolOxYbnIGW+K
X-Gm-Gg: ATEYQzyP9FmwwP4OF8acFLoC7qYfQH4NQNT7K6Pb/4wjDAQzuzTRvHILCnfYwmET3Sx
	jNFZ2OYygs6tNXY3THWH1222LTyo8v9zyaj6RzN5edbeHRVtffC19mQ+yRbXDpLoHhlNs9KCEIC
	yy4bcoDwgjkvF8vfSZ/aRaOkdwCHSmAE8urmzDyD99p2rYf0xZ5+SfXeF47YTHO4/28ywNjj1Uz
	y8fyJdnbKOMmW1jtgxcHXSvMWR8+TEB6iRPhtLOIHA6XkuIcF5BKzfk7yLQsKc3HuEKX2eEcVd+
	CyePI1uUaIMgiqgb3knmPBN5pype+JyHD6CC9kuNPe0eBAJ0rGqIra9DY5f+Dy+MOHI+x0re5u+
	rGJljARRXaFNjUK3IIVD5OQugWe7HhGEfrD/B4yMk3rI+j3WtR8qqZwjfkNc+JpQqWm3r0Kdqor
	tDETrY23Z6GcoA/mZTG4jDymNCJ+sXaE+KHwwSylr9UhqsYI9j5o0m9/w=
X-Received: by 2002:a05:651c:400f:b0:38a:210d:2cbf with SMTP id 38308e7fff4ca-38bf963e5bfmr26130401fa.10.1774285664361;
        Mon, 23 Mar 2026 10:07:44 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf97439c9sm28879631fa.10.2026.03.23.10.07.42
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:07:43 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38be5e86918so3361281fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXU4Q4scrZHbS7OMJ2aK9qj/9Y4zmz5UuAyN3UWvOtmrBeJYziJZAqQLsz+hj87K5CYbVE/R1JN3BY@vger.kernel.org
X-Received: by 2002:a2e:9bd2:0:b0:38b:f0f0:e3c0 with SMTP id
 38308e7fff4ca-38bf963ddd7mr33026081fa.9.1774285662722; Mon, 23 Mar 2026
 10:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-3-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:07:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v65RBGK4Tb0=2D=8_37AQDt2GL_kEwd1OjqQ6ziRWqy4tQ@mail.gmail.com>
X-Gm-Features: AQROBzA5T8F1z2ogDDbAkrNKbAgfLdiandHWSkKdFT2S7GO1Ch51csLHtutzo-M
Message-ID: <CAGb2v65RBGK4Tb0=2D=8_37AQDt2GL_kEwd1OjqQ6ziRWqy4tQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: sunxi: Remove unneeded IRQ remuxing for some SoCs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[csie.org : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,mmpsystems.pl,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34043-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@csie.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	HAS_REPLYTO(0.00)[wens@csie.org]
X-Rspamd-Queue-Id: 86D0C2F9D98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> that line is muxed for IRQ triggering (muxval 6), but only if it's
> explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> behaviour, so we added a optional workaround, triggered by a quirk bit,
> which triggers remuxing the pin when it's configured for IRQ, while we
> need to read its value.
>
> For some reasons this quirk flag was copied over to newer SoCs, even
> though they don't show this behaviour, and the GPIO data register
> reflects the true GPIO state even with a pin configured to muxval 6
> (IRQ). The workaround is just more costly, but doesn't break otherwise,
> so this was probably never noticed by anyone.
> Experiments confirm that the H5, H6, H616 and A523 do not need this
> workaround, they show the GPIO line value with both muxval 0 and 6.
>
> Remove the unneeded quirk from those SoC's pinctrl driver description.
> This should have no obvious effect on the H5, H6, H616 (other than
> being more efficient), but the workaround is broken for the A523, so
> it fixes (one part of the) interrupt operation there.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 =
GPIO ports")

Acked-by: Chen-Yu Tsai <wens@kernel.org>

