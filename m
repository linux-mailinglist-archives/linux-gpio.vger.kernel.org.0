Return-Path: <linux-gpio+bounces-37561-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCZ9Mo+nFmrEoAcAu9opvQ
	(envelope-from <linux-gpio+bounces-37561-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:13:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D845E0E51
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EFE0301588A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 08:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319013D0937;
	Wed, 27 May 2026 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftnF4fhA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30743CFF7F
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869580; cv=none; b=eoo9w+jIzzZUN96u8DT4faQepTjsux3uWG6za0wl6ip1YJYWJ/FqNYT/HGzNHRVbvG/YI33iNF5jgczYMvKnd3tbONV9CxjMw7UIVSmys/dUJkRvgDna+wMCwGZX04XdPVRoELwNRUJNQHN2RLSxhScZPydnuVbLG0ni2V+H67g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869580; c=relaxed/simple;
	bh=HWC9fwCuTJ9oOdNtWLVoGh1IjbBPxggRuAyj9NJ7kzM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YW6Mdx0EmdI7KGdRKkXJaBFHMATdf7LNartVx5boOVCXcPZrq5npJa9mOFQhRmEkpKzWEl/0Htsi9Y8IECigdA9YIRvK0vbZcmGGMs/G/ZBzXD93PXdRT3cUO2sEvDAWHMA1XZQ/1SR2mYFej2uPN5bmLfehrx7UAlHVO6q+nKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftnF4fhA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F911F00ADB
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779869578;
	bh=Jh2My/4PVMTyrzVKY1/X4qz5ahSG+REoamijQn1whwA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ftnF4fhA2HYjSyeCQJmmgUYVt46QoseJlLvYe+tEnTi7PAsGwi0RWsDOnTfzClziT
	 KiGjm4SaKCfHKKmP/tCYIxyzbZvP4k+QzOviAWYc+yaCFG9AfrCXYFmWI3lP3SKwDr
	 UyzRbk7VDJCOwRH1U98M4fPz5r9Be8bhLWHyXJyBWvj1UNy1WnLa4Db8VI0NU6Lzfq
	 c8n+/6ZTBriwDTG5tb8MbnSlhDKwBbi0GDPer8vRbpwPID8TVJ2BrWiQ5to0Re6iOy
	 SnTmy+jimZigEJmksEekHzqkyp0YdlR0k35KqzviVfG7b0xYX4z44awmrQ8g/Tfs5+
	 /0ANeRFXELnEA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393d6025f99so111000391fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 01:12:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9YKqk0fMpTipFHb/3HSYdVifnEaPIBvCaGwLEVTkS63TZJXDZJbSMBDiCuOK4UqecT/sTHFjwaVJ/c@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHC47KN2p1cjy1QwkEpYk7Za5BlMM1yHWrHhHgr3ktwv3WBZz
	APWBPNCZeMqytFCeMvIMCK+8R1tO+t2+UV/JAOxoOAkslbTxIloy1F7/tqS8APeIzghrHcreH2I
	XsiixqZUKQAg3RoI/tc8m0E+I7xg5DZOvQV7PArOVpQ==
X-Received: by 2002:a2e:bea0:0:b0:38e:866c:4340 with SMTP id
 38308e7fff4ca-395d8e1ac2fmr70867421fa.6.1779869577440; Wed, 27 May 2026
 01:12:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:12:55 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:12:55 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=Mdid6eE0_Vy4WBBz5OQuNg6fOmBGjjGHpWW_mXrcSMA9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=Mfk9tP091DN=5kjb8fvFhj1=MiBZSq4NJ7+k5LNCVy9bw@mail.gmail.com>
 <20260526171050.12785-1-scardracs@disroot.org> <CAMRc=Mdid6eE0_Vy4WBBz5OQuNg6fOmBGjjGHpWW_mXrcSMA9w@mail.gmail.com>
Date: Wed, 27 May 2026 04:12:55 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mer5Ped1G+6xcuUhnzBoK_KLWjgD6VP6W9F=M6=U7sjkw@mail.gmail.com>
X-Gm-Features: AVHnY4IPDrzwDPTV0moNh90kVcpKP4hnCVac7KNo_swmvzfdOXrfSiJb0NLgTYY
Message-ID: <CAMRc=Mer5Ped1G+6xcuUhnzBoK_KLWjgD6VP6W9F=M6=U7sjkw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: rockchip: fix resource leaks and teardown bugs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: heiko@sntech.de, linusw@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Marco Scardovi <scardracs@disroot.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37561-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44D845E0E51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 10:10:23 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
> On Tue, 26 May 2026 19:02:44 +0200, Marco Scardovi <scardracs@disroot.org> said:
>> Hi Bartosz,
>> thank you for the review on the first version of this series.
>>
>> TL;DR: There's no clock-names property in the DTBs for the GPIO banks,
>>        and they don't expose a separate debounce clock in hardware.
>>
>> Regarding your question: existing DTBs currently do not provide clock-names
>> for these GPIO nodes and instead rely on positional clock ordering.
>>
>> While we could extend the binding to optionally support clock-names going
>> forward, the driver still needs to remain compatible with existing DTBs, so
>> it cannot rely on name-based lookup here.
>>
>> For this reason, keeping the index-based of_clk_get(..., 1) lookup together
>> with devm_add_action_or_reset() for cleanup seemed like the safest option.
>>
>> A good example can be gpio1 in rk3399-base.dtsi, where the clocks property
>> is defined as:
>>
>>   clocks = <&pmucru PCLK_GPIO1_PMU>;
>>
>> If we switched to name-based lookup via devm_clk_get(dev, "db"), it would
>> fail for existing DTBs because they do not define the corresponding
>> clock-names property.
>>
>> Additionally, PMU banks such as gpio1 do not expose a separate debounce
>> clock in hardware, so there would not be a matching entry anyway.
>>
>> Therefore, using of_clk_get(..., 1) is currently the only approach that
>> preserves compatibility with existing DTBs while avoiding regressions.
>>
>
> I see. Can you please reverse the order of the patches? The fix should go into
> v7.1 and stable branches, patch 1/2 is a new feature so it'll go into v7.2.
>
> Bart
>

Ah, nevermind my comment, I see patch 1/2 is a fix as well. I'll queue these
and fix the dev_err_probe() thing in tree.

Bart

