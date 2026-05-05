Return-Path: <linux-gpio+bounces-36184-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HgGKWDL+Wn3EAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36184-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:50:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7034CBD49
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E86ED301678E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 10:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEE3382380;
	Tue,  5 May 2026 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QsGj+Ja6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C756130F934
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978202; cv=none; b=J+ZmkKTYxqp8pbYB0MwROIbyQ00pIcgk/rjYVYbliiMoBi07bRyGin29vP5ZMka9ZnrKhYEkd1V/A7VWDIu+1Fbt3Kv5Fdmkoab7EHhdnMSohaYJ1Mh31A4W9jic/PRkSSMtyaqGu2P/eZXShb535HvQCgsGv4RG9q80nB//epE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978202; c=relaxed/simple;
	bh=YcedT8Hfo7viBomSJ6+7C6YDOpC7Sj4vecnEZZ9FNFE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=P/1AVV6SRLFxEkFAjMQAaoTP/nODYdN6E65wPeJpw0fgSsYmkASspGtoIEN73LEwxllB7oQBpwqIyNz73hgqx79Yzl4lc6djetSiec8Qcfv3aAQnkzZdqX1Y6gnttpKz9etVcSkVbliXKGdsUsUC/Uu4TE8BuKzVDjQUzHglCPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QsGj+Ja6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso8108252a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777978199; x=1778582999; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcedT8Hfo7viBomSJ6+7C6YDOpC7Sj4vecnEZZ9FNFE=;
        b=QsGj+Ja6HsATb9yOQ2YXRaCLv+zbT6BEsknbCFiKd1mQmGjQ3qcvmOd+l7HId964IL
         vtL2YKy9oHvbVs0z0ZFBN8zke8ydFDf0PYflw25xLb+Wl3lnUbPC8ikhcJ2nATeJb9QU
         NxHmRQuzf0RSxyprv30zDph1m4LjPle6InXQx95VeOKTDbfQ/87S/PveFpZNhr4uoUwo
         PkQrr0on1C9v9wLgK/6LnTg71jikv7HVcbO80iouPZKR8h0xnHmvw9ZlqWhkCJxspfUm
         VopKU9H/A2BiL8IbDWwlOQ/fTKkAyhZhJRSaYk8rRvin9PlvCyne1HUgGsKu7nSQrJq8
         Ov/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777978199; x=1778582999;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcedT8Hfo7viBomSJ6+7C6YDOpC7Sj4vecnEZZ9FNFE=;
        b=NMNtJAQnuJoPiC3EabGKM7x3rsv1ocOGiimxtK/yUYMkQDz2IN0ybU1HN7QVP0x5NG
         C681Mi/EMi4dqFe28VegtQHkUrVYOz2j3HXdIntIlrzxipMfNnFqkhL4eHEQPvI6eMAc
         /CqexlXfzfHKGFShJAdf3P+zExy/rR+dCGbUU8Cr0UtKU/6YbJJL8ErgN2Gg8qv4t5AV
         75K+db2z+87c3WsHTee5eN4l9T+qcPNQwdKNWWAxr/FB+lOk9e+htmPUp69XXEQjUoZ9
         iwrGyFOSNjuWdmTeZg7Im1gDUg/GGsb/jltFBq4qxndTklpzqc+ASpkpMOioUHTtFVlH
         YJXA==
X-Forwarded-Encrypted: i=1; AFNElJ/qTQzAbgPZnZaxIFwc91hVVUEQRjScCX7oj9zsE/dZVQQ4J6utOEhmNzBzkQRiPVMi1xRVvF45w9D5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr/z8kBVD6QrVmGDM1uM71yZSqAbdAZjImbbTuP/cHgf8xjCBc
	Fb2At2KMC9nR8UOsZLsSgy+a/YdXWV4THG+NkHwaayed7F6+cGFW5jtzoLfgyqnGWuE=
X-Gm-Gg: AeBDiev1vXXUSAmR16xdPN8WRZQqBoQjMWCtUPEyWixu0JXctBr1uFEQU/pfXBf4ZlF
	vwz6a1SJQItDu+ziG0vvRXa9O2QwAMplxyBsQ4Ra/kyhO3W/fCNYTHWbaWHqy+rxuYwQ54/qqYa
	tfd7ZgKkvVLvDgEGCIdO7XGBjCyHt2fD3vvgJ3TF103zC6QJljIMNLeB0bJqFMCkmhEbw4UqZAY
	/gb3/VLiXmwAT1xKm1gfbVZThXizUSzpiEpNd2RcO5bu54RsZIb5Sb71ubaP7HlFkk1YbYRNbXw
	t3lADpjBC6DeFcNRJPfUbB0auWKdmlJHZ+w3bOZsGsrKgblBwRVY/FNdfByxzyHz/OALPWU5Xvk
	BvLw0XvgzPesxbGrUiszAYVuIFbuu6vIzSTGTanaqf8APR2kz+kGCIg0sKNSUSE4j8zvhCAz1u4
	3lhJjCXighsSX3g7B8dhzSVFJlS1XAXO8jESLgLh68BTasxCeOi7hKrlUZtXfEOTT6rgRIQFF+1
	bV7p8oGWSMGShs+izt3C0333VA4GIsfQjgMBbCcs8zTozY=
X-Received: by 2002:aa7:c707:0:b0:66c:17d5:c18f with SMTP id 4fb4d7f45d1cf-67c1aab2f5fmr4883394a12.21.1777978199217;
        Tue, 05 May 2026 03:49:59 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd904fe68sm297388a12.0.2026.05.05.03.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 12:49:57 +0200
Message-Id: <DIAOO42VKFTK.A241C4JZT34G@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] Add LPASS LPI pin controller support for SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Linus Walleij" <linusw@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
 <CAD++jL==mAQAmfQDcnasnjgXnTsN46nFBgFuHOz_1Tf-k-3BpQ@mail.gmail.com>
In-Reply-To: <CAD++jL==mAQAmfQDcnasnjgXnTsN46nFBgFuHOz_1Tf-k-3BpQ@mail.gmail.com>
X-Rspamd-Queue-Id: 4B7034CBD49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36184-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Tue May 5, 2026 at 12:35 PM CEST, Linus Walleij wrote:
> On Thu, Apr 30, 2026 at 9:10=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.=
com> wrote:
>
>> Introduce support for the LPASS LPI pin controller for the Qualcomm
>> SM6350 SoC, by adding the dt-bindings, driver, dts bits and enabling it
>> in the arm64 defconfig.
>>
>> The custom slew offset for gpio14 is described as
>> "qcom,lpi-slew-base-tbl" in the downstream dts[0]. I've tried to find
>> some reasonable solution to have this handled correctly in the patches
>> here, but suggestions are welcome how to improve the situation. There's
>> of course several ways to implement a solution for this.
>>
>> [0] https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-=
extra/devicetree/+/refs/heads/kernel/13/fp4/qcom/lagoon-lpi.dtsi#25
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> Fixed up Kconfig text and applied patches 1, 2 and 3 to the pinctrl tree.
>
> Please funnel patches 4 & 5 through the SoC tree (Bjorn Andersson,
> I think.)

Great, thank you!

