Return-Path: <linux-gpio+bounces-37701-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BkDDTv2GWos0QgAu9opvQ
	(envelope-from <linux-gpio+bounces-37701-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:25:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7C2608828
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 822CB30320D6
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 20:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FFE3F4DEC;
	Fri, 29 May 2026 20:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwvx5FXJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774B3F8EB7
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086324; cv=none; b=cohWDxbrNGFMBb9l/jyzBoUvz9rYW5UCFjgflja1TKZFXyGj6H9j9QFdVmC24ILRVgoehLR6xejXANYXcuH6mduC1p1rroGUYUr+/sH5zHU+tTjmz8i93XhR42vWGJR8fbG0oVIWau8pz6i9fTFHVWqHlENiA2vB1Phh6ON6pZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086324; c=relaxed/simple;
	bh=0WDNHiD+BZ65Ar6D6wNntHf7njQpuEgEybxUL3DMUEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fuceo6dIiiy1I2GdbddekU9bvgIVEHM67AZzZRqLW1MMaxj6UGeOAKEAN5aAm0sNpLGvmryMMHlQkx3XkgoEkNOFMNCFyvuB4Vz0Cl5B6GBAxjKnYNB6GrjDUBcA1AE4gXeKsGb0XpGSh5oihHa8AhuCxpqcNh0MpZZp/Sf7Yow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwvx5FXJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAC71F00899
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780086322;
	bh=0WDNHiD+BZ65Ar6D6wNntHf7njQpuEgEybxUL3DMUEo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lwvx5FXJilSw9OVDTMZ6br+yvBAtqOJd2dAeeZPzX4bZ5mlNfdaP2sTxkdVr/U6sd
	 X6owIdU/uFR8Hq99iC6hLEVZKrdhIPLCUI2W9rGsAH306lriaMdxqMpHGmy9X5h7zP
	 Vdo+1o8uCNQ5wrnsoz/rRsUUog0fttb8GcecAGnTwzF4qhXMMa/mhF8JrAJNNf5kCu
	 vRfpKf5I6ByqvgLR99r+W4eNg2/zUHrx1vjJUo9e0fERD4SV9S7nHZXVhUGV+oVev0
	 lTFH3ZJXzfXIXJKa6ALYow7g4r1WADa/2nSElb+oUum9gLrnRmRf8zy6LUgNbCROum
	 6WLX4Ewn3VwoQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa5ee1f07fso410405e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 13:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qZ7mSN2VYSjo0RCq0fVMtuB9C0iLcVDwnyRKXrfheomRA86ya6jYaZPRssWd01Eppp8Bz1oMUjWix@vger.kernel.org
X-Gm-Message-State: AOJu0YzP24cbkLAnp3emykG18JhTNxbH0Di8odR4T71HonoRS5ng3VpZ
	JIxFpI32wFspK/Vc/2fO7ejVChaJc4dj4r/ljGPwsIn+uuzLPDcHvEJn7YMic+Ao1UHjUcKEBqU
	UTbCJw6ZSxAT2nUdXfRxeiG2ew8cYtTc=
X-Received: by 2002:ac2:4e14:0:b0:5a8:f6fd:f201 with SMTP id
 2adb3069b0e04-5aa607adf72mr422699e87.15.1780086320986; Fri, 29 May 2026
 13:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
In-Reply-To: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:25:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLnK1PwLcjeFuv1sCYhe9WQLi6MN6S8UHO_poh28iEFKVg@mail.gmail.com>
X-Gm-Features: AVHnY4LXAJrI8t_ItYg7fZ1mD4eacY2tMVyI4OJFiM4v9KHCpnnptx1nZjWucbw
Message-ID: <CAD++jLnK1PwLcjeFuv1sCYhe9WQLi6MN6S8UHO_poh28iEFKVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] pinctrl: qcom: spmi-gpio: Add bidirectional
 level-shifter function support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37701-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BD7C2608828
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 3:05=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualcomm=
.com> wrote:

> The PMH0101 PMIC introduces BIDIR_LVL_SHIFTER modules that provide
> bidirectional voltage translation between 1.2 V and 1.8 V power
> domains, targeting open-drain signal buses such as I2C. Each level
> shifter shares its two physical pins with a corresponding pair of GPIO
> modules, and its enable state is centrally managed by AOP firmware as
> a shared RPMh "XOB" resource.
(...)

This cover letter has a *very* long text mass, something Andy
Shevchenko strikingly dubbed "Dostoyevsky commitlogs".

It adds completely obvious descriptions of what every
patch does breaking the rule of "don't comment the obvious".

This is usually a sign of LLM AI-assisted commit message.
It also contains emdashes and other obvious signs of AI.

In that case, please use the Assisted-by tag, because the
LLM can then read this comment of mine and learn from it.
https://github.com/torvalds/linux/blob/master/Documentation/process/coding-=
assistants.rst

Yours,
Linus Walleij

