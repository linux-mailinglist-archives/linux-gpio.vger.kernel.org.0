Return-Path: <linux-gpio+bounces-36093-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKIWFbcH+Wnx4QIAu9opvQ
	(envelope-from <linux-gpio+bounces-36093-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 22:55:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AF64C3C9A
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 22:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54ADF3023D9C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 20:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9883246E8;
	Mon,  4 May 2026 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1h2AL3v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7D0328B56
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 20:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777928093; cv=pass; b=W5DiLhSZpTQFKFWAM9co2VvwYLJD1c6zmjKHDjMZqPzzKsfpVB2xVNqORrxPxv9373vOp3MVnkAfH7zudEFTgVXp29GpYZBtr6cax7JdGJREc5nsnXim7/ycu9biGg3nYvkug9uSG/9IK21GGwXqy0izwHL0fYLuB3kqd9ntSkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777928093; c=relaxed/simple;
	bh=PoTwka10vHPGzjp5IC4DSNOnMbtIdzciiOmzpBGqWwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6hQDjWOHlQ0Qd9+aaYc3FwDb4rMtqePpigikKYBoayvtCgYQKj4EHk4w5HK7Fc+TTUZJIPz0eEOrKEKgfDMqQckmQdhLnOT6d1htOdqSb4nR30T5aewnBPNfd/ljADrkbOPRlCjB5hCBNsRvVj3leOp5aY4f+Ce+NOB0Rr8msM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1h2AL3v; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-651bc8f864fso3105311d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 13:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777928089; cv=none;
        d=google.com; s=arc-20240605;
        b=frlFDsXPLZ3SG6Ga9VzcrTaR9a1CBuTfoijK0K1+rGCSn1zRf5XaIgEw+NNrT3xAPE
         uTpmLx3RTTvORlTDr7Nr/Xq5tOFfG+buw0n/9T9p7kW00uUb0yISvo/ANne05aGpKKwL
         Vr+1liTeHk+RMS389FjgktBL+4cWBm6G1SsuKeFo0V/TLBxW8StHdYb5CZo1tLAUhE+A
         E9YKe/5tg8AVNzUoaPM+Ltysmd0RoRn9svsRJp4wLYqACU9fl9KQVsxtlABG9uzfHQwM
         s27QNRAqiziXeQ/kxzlD/aWKT+l5iMWyuFCBks2KN3iMr7pUVPgkbRaVr9oSmsu3cBXI
         CSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PoTwka10vHPGzjp5IC4DSNOnMbtIdzciiOmzpBGqWwQ=;
        fh=ltdzJud0L5rb84ZTAoC+N7FbMQrqTt/2wjiN8tMDpBY=;
        b=Jb3GqhCu7ojZu5DTqqvyGxHydt0QugHAU7IbVWf2rBbVCvo6fKcyPNcYf5XSZMMRN+
         lW54kr2cuT0+eyylM0uob1UdTDHHcGHKyj5ecMaIQw0r+F1O9W81ItwqdqLCsNggTBXz
         wCla3Uipm4Ue0ySoiQIhibCgoSpdu2Wx5Ge/K+70b09DkgUeg5xx/UgUnpc19vJL8QPR
         ryhmd9lx96Pk+oqRF8UOtwkhfOXVRwLG3xNhWgp0bSHg+PTo4Oy03lWeKqDl9hyZYdl7
         WQdLoaJj7NwHZM51DTTwGO7wpwo9I26d5MZb59J0p39w5StUK6bdoLr7l5I0KMEzi+DZ
         N2sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777928089; x=1778532889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoTwka10vHPGzjp5IC4DSNOnMbtIdzciiOmzpBGqWwQ=;
        b=G1h2AL3vaGfMgpEXIywhlvRrbtB45G3flW/RBMK3Hkp1ORp5dWLlfo8aoqEHfW2UNs
         33Ou1A3akCSTqz8nrYMilu5eL+3PWWth37KnGnJY4yS+r6Xrbt7nd9abQ3PBhY5lTqV4
         MNZdq5u929EgxCbLp2ZAxRvG+oNPgvALGb3EmT5clpeNsT8L9CRWNaAwN8kArKBdZuaL
         IRxpN97t4nEZ341pogiJDoQbBsvqFJPe9BFh/F9J7XTflZQ1VRS5iqOHE7ghqnGVaaE9
         fXa9cA9pn+/pnfogEJSCnyirTLJ9eIVaInV054mCq5jYFmMrchBtmmk9DZelfIlapcbW
         55aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777928089; x=1778532889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PoTwka10vHPGzjp5IC4DSNOnMbtIdzciiOmzpBGqWwQ=;
        b=nP7OVAob40kyDW1n3+6M+rrXgTZOLRupJR1aqftsArrDhbvjLvvO8aRp/S9+oIy3Ka
         xYP/VlDovn7TC6p3+ZgUKqM07ETlC2M/yJ5zhhbtXREaLTbJ7dH6jqu/GpS2x3u3THy2
         Bt7StJyXb3+W9I4CbXn/LeUWAxH/NkF19PTu97rnpm9sjN02mWX6gdtXIykdGeox8vpH
         iAf0XX0D0JwEj3u0Gz86WsiTtx1dAY/rcic0aFWAluyE958Pbi+OpBl+zB29eTbo5a1n
         7qKu5VsNMDkk1hT5QNoo8wzBpxW53/mXM6ayVXrSBCTR5bcGXeax4KfeoaezjGnIe17y
         u7pw==
X-Forwarded-Encrypted: i=1; AFNElJ95qeUHhTGzPcKsuv3I5hzf/U4FSgOjQpM3Fe7+7uzhw5AQUvdi4N2U+qMLbRor71wjEOrDzkBG705D@vger.kernel.org
X-Gm-Message-State: AOJu0Yy93Rc6ohLKzwgwMi434zWs60Ggw987tdcWMTDlALkHS0AaN4ZS
	S2+z2cunjB5jna21olRxkd9oKSG5qictXdtQT3kErsxjBxJZsKiFS7Fysxvr3DPsnYW0EIcVFmH
	JKn9Wy5YrYvmwtf1ZK0q84mP/OKGijvk=
X-Gm-Gg: AeBDievxBz99UT7CdLMpMj5+dJfJgOVuIYmnH2bo/wlNHCYRcUni/mryEVhbECJ26/7
	vD7VPXBuz3axiRLefJ8FuAHYKKLbdM9L3NJZUU75apE73gm6ZoOzlA1jO8qmuP9awH6OLjkvAKq
	Cr7jI2Td/2T9q0RZ/GLfXioIlhPfu6b6NexNXNj8t0sQ9GW5GzwHbT8xsgtnK5xPWY2fn67315M
	ciARhEpFvPnR9Hti8LE+vjP2eTNwm94FSijOVTugxJMoojCW+pGnDEtIuwjEG5aF1v23spSR8my
	z1eypTTMINsuGyVUuRz7qNOwusb5UWaqWfT/KoTzZjQjzh5KJtTh
X-Received: by 2002:a05:690e:4403:b0:654:cefb:2d71 with SMTP id
 956f58d0204a3-65c3daa696amr9259401d50.32.1777928084524; Mon, 04 May 2026
 13:54:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504195251.53771-1-lucasp.linux@gmail.com>
 <DIA656PT46GW.2Q15WVT679RS6@gmail.com> <CAKYXYMRX-oV6iO+Kh+dV7_2BfsY9gjdXMw6cueOgYw2hjLWeaQ@mail.gmail.com>
In-Reply-To: <CAKYXYMRX-oV6iO+Kh+dV7_2BfsY9gjdXMw6cueOgYw2hjLWeaQ@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 15:54:31 -0500
X-Gm-Features: AVHnY4JpbCcbgZYbegfV8F-YqQs5FP6W2nS4bbTQv-RT6NvvnZ3R_xL1l-ouoC0
Message-ID: <CAKqfh0EPFPxFN8ime2EaO9gP8z2m8mshR9b1dEswgzQe-2Ge2Q@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: replace strncpy with strscpy
To: Lucas <lucasp.linux@gmail.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E3AF64C3C9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36093-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Lucas,

On Mon, May 4, 2026 at 3:34=E2=80=AFPM Lucas <lucasp.linux@gmail.com> wrote=
:
>
> Hi Max,
>
> Thank you for your review and your kind words!
>
> I will follow your recommendations and send a v2 shortly. I'll make sure
> to update the function call to include the destination buffer size, and
> I'll also correct the commit message and subject as you pointed out.
>
> I'll include your "Reviewed-by" tag in the new version.
>
> Best regards,
> Lucas
>

Actually, timeout, I'm not sure if strscpy() is allowed in tools/. I'm
going to double-check and I'll let you know if it is.

best regards,
max

