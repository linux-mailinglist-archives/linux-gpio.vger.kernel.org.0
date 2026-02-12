Return-Path: <linux-gpio+bounces-31635-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNRSH3/pjWmr8gAAu9opvQ
	(envelope-from <linux-gpio+bounces-31635-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 15:53:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1CF12E9CF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 15:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C303730C15BA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 14:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4644E35CBAE;
	Thu, 12 Feb 2026 14:50:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A77B35CB70
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907805; cv=none; b=b0UixFf1Oox3/8tNo7NlALCZMEy5LwF4oEj6v3oLwtIY+Nc7FBSqNQtWwhyyCUfEKhSd7hedURpZ7+3dBnPn8nY9vEo6dbuHXBDAGKTQnK/jV0/UlrRjS90TGYiWyRKngnp35r//NQHJQk2Ep0R6vEuKx7nWhUdCeXEzfuHJtMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907805; c=relaxed/simple;
	bh=zx6AgySWs3CQJ/r8IU+PeotcYw8+mqITBNN+IS1KfvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qk8CfFbpTTgZJ85kJluTJSkfokvg/+fLiJXhStHcRNyeJQajEOU+xTLN/vNatrA3IU3e4Ez8/6S2ImXuhsinxUXu0AIXXzWj70BNwpNwy9y+snukuNtABNzC/8j0skiB174yvy2MlRw54I+5016cXivMGJNDoaGIf/jNqLkbEmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5f5418c40daso1869262137.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 06:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907802; x=1771512602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0NvQO/wNdDzAnDN3kqPLti/mAGnL7J/5+U3O5NXismk=;
        b=WnLAQBKq3C6yRRe8m0amJlASCWrZo0T4H/d+CETsG9d9HGpE72HLCp4atAR6Rd9HL8
         02pWkrWECLb/CcDgp3hmE2LbST7mwqb4btVzKmkXCK2LZpWgW7TbVI2eiFRl8MFKR5SQ
         4hJb15JOb5iSD7eOao+dZXqeOJcnsvsbolcWKlwLL+lv41QoCiC4pdHNpzJ18my0ahia
         cm1z7WnafQksfdmzE9bndi0ZGmntyFeLIyz0OpbpLojdO4UD2nsJBh8s9gP+ZCLb6oi1
         s3bxbjMh+IFiKvxaX22yPpvBfE3gUOjtGtRIWk4l1R1igmLRVK3o96MmQ1D9c+Cvj5GB
         NVjA==
X-Forwarded-Encrypted: i=1; AJvYcCWopYg0hjh7i2jInLJ7QAMEv45d2BTSGyri7Me01La7kvXzhwbVE/coPuyhqaQgVZ+f4cyXFa7dXrD9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvc3n2l87aQaYKYe73IlJCR15MkAMIZvJUgZ/5r8gTLGfzR8UQ
	vWmrbQVm7BYcZxfpkBfDILeuuvmQKTp3ECocwbf5gM55opPjyE1Fq4782Zl5nJJz
X-Gm-Gg: AZuq6aIJxDLGq4a+KPJR57+3x4H3OBdyJouEagH6K+AGtjhL359AItePgKgCqcuzbn1
	Dt85PTWDOCSp7uh3cElC9Kj0tNFZqL1qcDx9NMgIfEER5KjG7QJK422QINLAzWrTwpSa106DDO1
	n1bn9METwjl3+f4u/XEXoo/8ylRfbTv8ZZeGdfBMQOrlAW/09hV4wi8WsXMN+LMv+I2MLfwZ+mw
	pXraEj0JsqRjKNEsiJ/5EQfyCOPCiSnNLTP3MNCwLuTXmL4lFWNX+7eOllkxL1v3kZX89LkwWSH
	cFaRFOhHKRpggItqfD9BMxX5CHEFkVRa0riDJCBvrIGakZfWFmY9xy2bI70u4Qow/F7wam7uUaJ
	aK/g+TxMBFTdt+X88cpXcA86uU5s6XPOAGihWeJ7UETJFEBRn7RYI9XaHWnYZXRJHE0TjsRtNn2
	+FR2cCdGkrjIr2q3sBTXQ/HkC4jtW78UyW/DAk4JC5IVgMMK0wAKduPt9DbYbzGfV/c8UIRqo=
X-Received: by 2002:a05:6102:c87:b0:5f5:2e63:f582 with SMTP id ada2fe7eead31-5fdfdd4b229mr938657137.14.1770907800524;
        Thu, 12 Feb 2026 06:50:00 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd343306sm1809828241.9.2026.02.12.06.49.59
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 06:50:00 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5f5418c40daso1869211137.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 06:49:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPa9DsVohr2WtC8oEJG1rSrfw+JqjLqzTNVMN2zt5K6PzcTRNPEvKFnfrAfQk5QrcxGNzxq9B01N3/@vger.kernel.org
X-Received: by 2002:a05:6102:b16:b0:5f9:2ac5:2fc4 with SMTP id
 ada2fe7eead31-5fdfdf15952mr936376137.17.1770907799750; Thu, 12 Feb 2026
 06:49:59 -0800 (PST)
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
In-Reply-To: <CADvTj4oBtO0Yhib1rE8QQwgtJvy-x_hK46C63mjVAydtxHOV8g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Feb 2026 15:49:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4oNeGY4VP7zajOS17apnjqS050H5L+Pxqe9bqqt=WNQ@mail.gmail.com>
X-Gm-Features: AZwV_QikOS80PENLHmR1lFwFY0-ZpGoOD-VsDMq5xij9EK0PUpviHol_KwwKmZs
Message-ID: <CAMuHMdW4oNeGY4VP7zajOS17apnjqS050H5L+Pxqe9bqqt=WNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31635-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EC1CF12E9CF
X-Rspamd-Action: no action

Hi James,

On Wed, 11 Feb 2026 at 18:01, James Hilliard <james.hilliard1@gmail.com> wr=
ote:
> On Wed, Feb 11, 2026 at 1:44=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> > On 11/02/2026 09:28, James Hilliard wrote:
> > > virtual gpio driver though so AFAIU it's not hardware specific.
> >
> > You can give example of any hardware where this is useful. You need to
> > make your case with actual arguments.
>
> The sunxi h616 board I have has hundreds of GPIOs, only
> a few of which are needed, I want to map them in device
> tree overlays since there's some minor variants with different
> hardware gpio configurations.
>
> Setting the gpio names on the parent controller is not practical
> since doing so would require setting hundreds of values for
> gpio-line-names, you also can't really combine sets of pin
> names across device tree overlays AFAIU.
>
> > > Use case is I have a device with something like 300 gpio
> > > lines...and I want to name/group a small subset of those
> > > lines for delegation to a userspace app rather than trying
> > > to set 300 or something gpio-line-names values, also I'm
> >
> > So if I change the approach in user-space or use different user-space
> > app then I change the DTS?
>
> The idea is to make it practical to set gpio-line-names for a
> subset of the GPIOs that are wired to peripheral boards.
>
> Say for example I have a control board connected to a few
> different peripheral boards, there may be different mixtures
> of peripheral boards, some of which can be used at the same
> time as they use different GPIOs.
>
> The idea is we load device tree overlays for the detected
> peripheral boards with detection done in uboot based on a
> GPIO pin strapping based detection.

Sounds like the work being done in "[RFC PATCH 00/77] Add support for
dtb metadata and addon device-trees" [1] can be helpful for you, too.

[1] https://lore.kernel.org/20260112142009.1006236-1-herve.codina@bootlin.c=
om

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

