Return-Path: <linux-gpio+bounces-31923-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGyFN4eXl2nB1wIAu9opvQ
	(envelope-from <linux-gpio+bounces-31923-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 00:06:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A826163755
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 00:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8683E301BF7E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7240832E6BC;
	Thu, 19 Feb 2026 23:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa1GeaHP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EE129B79B
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 23:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771542402; cv=pass; b=c9mG9TTXT6sHLVr74bFscJ/7kOO09oDyykVjDTgMyGgXMwBWNjW7KEYcZTdElGgIqwjmTWmzfQoXPvjecRKeOOlZOKS6hAYEnudr6ua3CY/pl5sGNtqDVw2QaLRdSMQnmIus7XCAWggDcUY/vzV1Ur0JZjMlkhQiG3b1P4ZhrK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771542402; c=relaxed/simple;
	bh=96HqTaavesBItYHeyUPmtsGxMUmKwaiWfJC5nRSK0Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YySDiVWedIdEM64YDKzkg/9TMGAHIV1vjVeoGysfN1wivJ8k+kNYMrvPc8KKoNt0r/8hsrIo+JKg5j4qt57cAqrFeMEr6t9ZhmrG+tSDNPAeJwsduz6qDTO0Y0im50LldbWqcsMLo4e8okp7FeZhQ89vEcQlPY0UFMoCQi5gESU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa1GeaHP; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-567404384b7so1028223e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 15:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771542400; cv=none;
        d=google.com; s=arc-20240605;
        b=TWyFbbMk3YG0v5S3IbAOvns8bvuHt+toAZbiXDQnx6M0tvxuSMSHauuMMOExiYI0q3
         uw2GyeQMUda6TScyuLIqZINIrBZxIORVE1jsDkHT2AIs0WxYCCrSGS5lLnyOh1DQYdtx
         mYzcpDTrPPaOeTJS/5DrP9qw7cww1OwfwFP3Yzz0GatsoZZDgdnVy3nyuz/aTmhEwnLr
         pDwUDPznb+mkFCYjk1LGM22vG8enxNU+/obTcl4U2GmF08pIqcpDaTrIS8t6NQWRCQZw
         UwtCJKEzt9b9TDQ+3vL9JmoX08YbiFHl4k/iMc05Axndv8zgDfp9/i7qbX3zimt2lzMB
         gCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=96HqTaavesBItYHeyUPmtsGxMUmKwaiWfJC5nRSK0Gw=;
        fh=7TJVPLFqvj8vVqxbl82+xfdjaqVfwAjCw66fNei+KZo=;
        b=RmHVkzvhwSXl5ShfplcG/JcrqStfEo8Fg50d8MUlOL5Dkx5cug3J4HuhA6OJmZ1h/w
         ksnA8qEOm/5kD7UOjlCZFGHkfVu7S55gTc1RouhnssE6d5HDaYTDQL+M0EQXN/nvJSJ2
         f5jp46lFprnMgCRfspqj/cGcmly8iIjnOFLow5WAHrt0P0QuWTIeLcbloT9IlGEvOBQ5
         kdIsikp1DfpKNnsALS0CkuX+iLix10eJMV5O6N36tjsW6FElS3BOSGIpL+roREP/VbPa
         vjb0BzdSJReOZMVY95lPCVOYmR3lW7HUpvQsSPpXiEBEsIoBdoVf5Dnhasdx4iswCHoV
         GJxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771542400; x=1772147200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96HqTaavesBItYHeyUPmtsGxMUmKwaiWfJC5nRSK0Gw=;
        b=Qa1GeaHP6lOA/8WCthdATY4kpxVnDgL4gmJvGjLpWopB60CSA3fE5oLa0GU/xqf7YV
         j1XqgG6X//cnwzOuQNctUNc0ZhFTcVE1kFcVIXzkBm4Ml1vc5KGqVWt8sp4IzyrSNbxO
         4rt1TRTKxYyCZqlZIWz4MUoQdTAfqYKZm9sKFuuNEg1iJM2Rkqrr4rKBSef+qnZu62gL
         nZeglD8UmzRPy+j4uZvXYIvIER5eTHOP5EgIG+IFvz6gFNE8f94bQ25NQVsrNvtIVgev
         9vB057qO97WbZgDt/lPLvF6F68vjxg9KsJswHBuaRt1nZeQ5dBkGU3j6fh3/kmtSYz4d
         Xggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771542400; x=1772147200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96HqTaavesBItYHeyUPmtsGxMUmKwaiWfJC5nRSK0Gw=;
        b=vdkpX6fPB7Qjh2EpKgziqv9jJnj6K/FBm5zZtFxge1GXGRUvFMgRyM+r+r835lI6UW
         gYQNkQQK3BDxd2ZwhBkC6pJ5hV2ShnwrlydCotcXUq+DelSnZFxJ2nHkioYfF7rB6nhO
         MKV9JEzLZE5JDyH6A7wBWjSAVbWwoWSisjiQPiIyc0K0ZrQ6pLrAjykgolovwLc6kLWT
         rmwxaA05Vl4Y+eG9n1Q6GSCadO2I70msjcuY02KL+9LYDNx+vNEu3LFqXgzsaeWjAK0V
         1vlVt3eT9FtG8lI8ajyCFjmLQbzFEp17mQUE752jsO/ZmSYVyIekdNOeGT4oy46uuem4
         B7Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUuSJcOoyPPOa90u/0A8YyhAPuV/Rmjbn+lm6YRWHs8LFQg3pXYop18qNRJ079wcgZOYbg+Ef3Re6Me@vger.kernel.org
X-Gm-Message-State: AOJu0YzvG7Kwasv9Gt4oqTHH+zyvsJlA7z+ZWi2TW7wzrnbpOXGZNrYh
	+6Lg/tTnnnaqVMc7TQPzkad2vlKnXsODCRFGZVab67d3+A9kVliQ+R5Ycg8Z2psj+FZZ9UVDd4C
	P/8WiiPXc57COSYkr8/b5QiYL09gYkoY=
X-Gm-Gg: AZuq6aJ8IX54ASTFQoTUwQVhEchP0tOwoqtR7rVt+8n3haEaKSlBGZzUM1V3q216n84
	kntIlMIc4ECp4J8y+7W8JO4z5nE2mRR/PLDcauM3BRjSotYTDIcdA2sE1d5su1ZiHAu94pVXkeZ
	lhIxLUNL6pYiIPajDxEL5f/CcTZjNPg+m+9VV1WDCQRgEF3pLTsw8v4LgMEZ5LlcvIV65wtf7Vg
	wVtuhr8KRMe5598xQRBQO3ke/r+hr/3o6dnKbbjWgB8/qaygNZBgo5zn+eIH5pPZ7rtUt+YUesj
	UAzk6zy2uYnxiDgnRtPkJOJPi0q12uStxkxVySA0B/9WHvzh8INNM1TfdbOErlSPOsY=
X-Received: by 2002:a05:6102:3e8b:b0:5fe:652:5d2e with SMTP id
 ada2fe7eead31-5fe2af573d3mr8450366137.24.1771542399933; Thu, 19 Feb 2026
 15:06:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <338e6575-ec44-4179-94af-9086a7ca79ac@kernel.org> <92359c6d-06ac-4f8d-baa5-6fa45a536455@kernel.org>
 <CADvTj4q74H__JZftOiXkdsY3+E_Xmcx6Y6i70RQDJ0K09=XOHQ@mail.gmail.com>
 <30026ed7-cd19-4be2-adbb-e8bb155a75b8@kernel.org> <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
 <20260212195423.GA787785-robh@kernel.org> <CADvTj4rPq8D5piqEijCdAjkWmZtq3Bi_Kxv-4F0aU4xi_O5WKg@mail.gmail.com>
 <CAMuHMdXmMVgPJv=HhkfttiRnSwFC6c2PnFjYwmL2hu3ikv+t3g@mail.gmail.com>
 <CADvTj4r95E2rLA0ZhOYPeFYpFbj0EXfb=omCN2Mab-Dj4T-cYA@mail.gmail.com>
 <CAMuHMdXTg8w3R1BVq3JO2z=gvTdB=qXY=aXvC7Lb8FtkEqz9ow@mail.gmail.com>
 <CAD++jLmp+47f-Ah4YdFJ+9dU0OFrnQdOcVyrQ61p0-_P61eBrA@mail.gmail.com>
 <CAL_JsqJK7PwyB=NoM+uXOgQk-RT49h4emogvYAfUAbZUpnd6Vg@mail.gmail.com>
 <CAD++jLkJE0ruzPeRMuVKJbJTjHoa-fTKn8djN+0es+hpqhELFw@mail.gmail.com>
 <CADvTj4rd3jS5VAPK1wyC8wKqohZ4kAX4tAJ9CfnBk64+cqrMUw@mail.gmail.com> <CAD++jLkZ++UoA-+1fUSgF1os0e-ND0dEADYM6OsFxCLQb65ygQ@mail.gmail.com>
In-Reply-To: <CAD++jLkZ++UoA-+1fUSgF1os0e-ND0dEADYM6OsFxCLQb65ygQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Feb 2026 16:06:28 -0700
X-Gm-Features: AaiRm53CXsaubQ4F_CSb1EX2iTceTpbwyGCvoOpivBUOSnYxavnfp7nDmFIvJnA
Message-ID: <CADvTj4pBDuXKcYJyOFM+sySw-=e1CToaz_Z2xo-qA=c7GkSP+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31923-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A826163755
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 4:00=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Thu, Feb 19, 2026 at 11:29=E2=80=AFPM James Hilliard
> <james.hilliard1@gmail.com> wrote:
>
> > From my testing, gpio-map does not allow renaming lines.
>
> Right, so that is something the aggregator will actually do since it
> creates a whole new GPIO chip.
>
> That feels iffy though because aggregator is really heavyweight and was n=
ever
> used for this purpose (it's more of a GPIO counterpart to a hierarchical
> interrupt chip) and the gpio/interrupt-map nexus is really lightweight.

That's one reason I came up with the gpio-line alternative method
of configuring line names using a line specific "gpio-line-name".

>
> Yours,
> Linus Walleij

