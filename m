Return-Path: <linux-gpio+bounces-33981-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEMZHdJ+v2nA5QMAu9opvQ
	(envelope-from <linux-gpio+bounces-33981-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 06:32:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E42E8447
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 06:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03F7F301496B
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2026 05:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6374D23643F;
	Sun, 22 Mar 2026 05:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYnzp/4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BzCRtYqp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE7257827
	for <linux-gpio@vger.kernel.org>; Sun, 22 Mar 2026 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774157510; cv=pass; b=pIVr5JoEtO5YCS9JuiYGqw6lFWrt1yJYLT841Sb5Ov6q5wvAT0gfm5cbAbWEOYKUOKQ/rluI2znz95dQASV8MXdSDaY/CYwxT8NuOvpVs5fvzMbdGhl/0dFMX0Sjj3d4vQZeTU7bbL8djb8PnEs+aT4GzHL/jnTxpziQbYDVtXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774157510; c=relaxed/simple;
	bh=KXSs/HcXhWiOOPMswor3shOWBLzA140o6i+GUpk9QS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QsB/Q6CSDH7Y31PD/U3Yx4ak6f7RCbSe8Wd/j2pmVRKaVWAhmlc9q+OKBpD2zGY1yjH4FEtEWKVPHF7L8cgTToQI+wsaJcnKssAOzWJwlpKpm7mt0fVhNpg+4lMdzd4k1ujd9jZ5WqACrwaoBRIPslLPPPVZKIfs02QxsNyQpOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYnzp/4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BzCRtYqp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LNnnbD4058698
	for <linux-gpio@vger.kernel.org>; Sun, 22 Mar 2026 05:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=; b=JYnzp/4XVMdkbgnC
	Ue3e7Q2azYQ0ehRD3mX08BeSOxwqD+1iepTPeyBtcRg23ixOXAXzcPRoRZAkkNvS
	oRJGyQxtbvBkHwLZ6HMA/YU8Oszb1H7GxOmY8S4ldynUEZvg94dqX35fn0LrBWsz
	bj05Duhp86cl5zD745UMyTBj2sovnfu7rQDJhrcvUCVDTLNmXYLwX5IMmB4gCHaH
	+SH56gHLzBLk6nR0F09zX8n3Zh7FhmlEeiYTa0xi8tAmL6NL5E8s90hNFAHF9W8+
	Wxviw1cTk6QjC2oRoa8XGBTlSiQsxKGXCBSeSnSNfg407zDIqGOsdCq1HYEYIERM
	zv4IDw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5hxbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 22 Mar 2026 05:31:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0ffce2570so72969930eec.1
        for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 22:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774157506; cv=none;
        d=google.com; s=arc-20240605;
        b=Q0Trqxd4uw+wHr4DPK/XGjtshfV5sxd8FhvlYrc/7Rk1+G5OtGtv090oc2ExmoxWz8
         fwTYk30JboRaD4ViloTff1N0n3tHscVV2M6Q0M1Fj9IGVVx72sdF/dnqJ3+u0tPRtzGB
         2Kxg3ZId6krX1d13yqWnB/PfDDNWndWl5vd5SE7Pq2RU9g5MdEhkpAAYDaYp9jcYAKbh
         KXXb2C7OBUQv8Bdo1BkQ+0AQyoUdu0lG8eXFC+nG7IbFyNX92H6nXYIrpqIqn+ewCANC
         64KSSPYIUM7+gKGtQtpGcXJG8wERhu/F7h6He4y0PPc4z++WyaeJlZqmvv00SRwZd36Z
         4LgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        fh=2Yc/Ugx5ZBjGfrS7M9N/95gMEK8H66YbqA3MEPHtGzc=;
        b=Nb6Cmozi6XZ7r1RdZG+c8kC56Ri7YqtDSS940tNvTOMHychJKFcRkIxq/f8seMi5WN
         iwiDGM0CQv73RwxOYnlUyeG5yFK+KCJ7uPgmd60jk6u/RHtLa/W5cmSZRDb5kTMFbbZz
         N7O+oMncdN90XaLZpKmtKZNPVujCmTuDnYQve70phe6ZCe5Q8T2oysC5aK0BeBqxs61z
         IyjAsmymWK+9hlUvnym9jFXpwtU+qn5zn4Yj5rAlqebQApwasnA+Y+mtdMJojKDeBzi5
         2RWlwc+91DIjAz8kRb+pDbfnKX+Zvo4Y2soNhBozVOBk+/KjrwAyT3EeC9RxKiEkDnKB
         fyOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774157506; x=1774762306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        b=BzCRtYqpHUdteTQMrH8UiEJEpGCys5keMQz4Yy55lDlUR3K2EnatCXSznyjDf5lb+o
         4h0yiyZ+36luAZqV/HHBBpva0kIVyC2t76qIndodohaVAgH18udQl5kHffGHlhb97Wnm
         mjT15aqB5Ouqz2O38GGPYPBrM4o4MV+SwAPxyqnmbPAAlvH4Of8/97VXVdMi4d2/C6Fq
         OvqQdjlyQ/Ljzl4xytEf6TZRb694Ne8hqRnItCM+vAlk3jFw2QOkAlQUCsjjXWPwLVkD
         roQL6/3xXWHStp3td0kbrAuuViOSQPvdMoPGwXmqF33F22CRPUOCaX1Ue2dxtsboAXo3
         127A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774157506; x=1774762306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J0ncGstOKXnQJs1g/XjQAdRNbIKLMqFi7AZ1Vp76DrQ=;
        b=WDg5KbOwOHTQQfl7+/L3uXuZUtXlM7xTNzPEr4e0xbyXuFAjnRiwPjaPhuJJEtl/Zb
         ro/9WWuPf11Mp5XQKhI+OyGNZ64PYxBDbEi7UGHdg613LnsROiO3YJE8BuoH8Oi5gZ7z
         8SAj0amh4grxtzE6HXcdOVWDIH0cwd7M0LNnnlM2NuTd29v0XjUL9HPYP4MUR9/BEM3f
         yWQthzO2TWaF2jZV6qt7DE9t1zIF1MN0IJb3VOZ2OjDwC6nb1pFqEYAF7/7bTEchwGPF
         GLozNekCwR3T+AOEkeS8LIEf9S9CGR0dCmjP6YljmJVenMxhjwHs54ZaXT0aRHvR3226
         BqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8putfr4kDHR8kuQwUaizLrS7qb4gjyk1VG2BqmiDjnTSadhci3vv9pgrjKCCcJ503jkHz2LQfLI9R@vger.kernel.org
X-Gm-Message-State: AOJu0YwDxhsS6qZM/EL+E6Dw+imLBV8rlYDQYA44N4m+xVMZveXHm08q
	OccWg3ympD/Z7BnrLdxHfEqMbAnWi58bD2U1fGd/298YSaDZUDVF9j4z3rMG0eLoSN467m/qs+d
	1MQR2ZBiAlODTmMb89Gz0z6osrm1xtaPRrGUTfdXGHvYjxGaAvk0BLBNPt0m3YD1PExaIyZN0e+
	WCCXmxTPdBsa6LhwLu2x9A9hpzXWpveHoj6in8JWs=
X-Gm-Gg: ATEYQzxMfyeIisYa+ALMhKxlf0urupPreYfhL6tA+tjNiWg6Zcq3S9ztzP5GpPowwTb
	o1axHcyNYluzW5ZVAjipsoS6PkfGDx68fevT/Xa0GunHcGYtSWB03knrMiNvyazgNYl2ntAhO1/
	KisOEdbw1/jmA/Jrej192hmcuTuFBAhRGWJlWE5S/KmCSSoW1b6WXg8HJvXcm310uSsIRORKoJ2
	Fgq+dg=
X-Received: by 2002:a05:7300:5b88:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c10962a891mr4064915eec.13.1774157505611;
        Sat, 21 Mar 2026 22:31:45 -0700 (PDT)
X-Received: by 2002:a05:7300:5b88:b0:2b7:32a6:82d1 with SMTP id
 5a478bee46e88-2c10962a891mr4064899eec.13.1774157505124; Sat, 21 Mar 2026
 22:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-8-fe857d68d698@oss.qualcomm.com>
 <6e33daf1-bb90-47d8-955c-12ccdd30ebce@oss.qualcomm.com> <84f1407d-62c6-4ec2-8976-eabe66c74728@oss.qualcomm.com>
 <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
In-Reply-To: <6679e85c-4eef-480f-882b-c64f8d0eb1b7@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 11:01:34 +0530
X-Gm-Features: AQROBzCzhjx0vKHwbPAUpiSfar1k4cq_wVtxI0SjsuisfOaHCCYWgZ9iiMzXYhU
Message-ID: <CAGptzHNyV=cFRyk=K=uXt+Jf5e-ONec8ih=h-Mr2x-xo_bmbGg@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69bf7ec2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=CIsBWlCQImJ4_lLhEykA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: PFBN0VIOx0iVhmLKloQGe54wK2mOpFVx
X-Proofpoint-ORIG-GUID: PFBN0VIOx0iVhmLKloQGe54wK2mOpFVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDA0NCBTYWx0ZWRfX7F29L9csXPla
 gKeFsNAtHWAIMbgschNXukGzxPz9pYb2kx92JsSVNJBj1/HFCU00JyVi2JOdrtxd7Yml58o6NHX
 PbLofOcdVwQ7XkOzbOg+uEcEzHf+DHK8ObXQofAnG3kASG5BjXD6DYNRgYsjV2+P/wtHPBgc1RZ
 PvtwozXeBRqVMM0QNT24GuL0jzDbqFVe7A/i0FbIaN7wzw80YoPbIdrnh36+UVLAItRkH3eW3Jf
 tcq4WIgQFDjNJlwmKbiGny+Sw07UAE/CiaaugwqVE3auk2WdQpv5Dy5nAIvI7w9pfg8UeBSjr4d
 phfKeJXE7CBn17mV5jYx72Rmp6a6GbQFBA5b2plpVYE52GpJ2y5o48CpBDNxBKEUJ8A9GBGthE0
 78c8OfJkVBQdwuuCS2du+Gx1h4xNPm3Lb+wuUEFo6xHcwwGniR9+2ilVR0BJePORCgXxCJtuNbX
 Kpf4jKIqUoe6IOnStLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220044
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33981-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 753E42E8447
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hey Konrad,

On Mon, Mar 16, 2026 at 3:05=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/16/26 10:03 AM, Kathiravan Thirumoorthy wrote:
> >
> > On 3/13/2026 6:18 PM, Konrad Dybcio wrote:
> >> On 3/11/26 10:45 AM, Kathiravan Thirumoorthy wrote:
> >>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
> >>> rdp504 board.
> >>>
> >>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.q=
ualcomm.com>
> >>> ---
>
> [...]
>
> >>> +    firmware {
> >>> +        optee {
> >>> +            compatible =3D "linaro,optee-tz";
> >>> +            method =3D "smc";
> >>> +        };
> >>> +
> >>> +        scm {
> >>> +            compatible =3D "qcom,scm-ipq5210", "qcom,scm";
> >>> +        };
> >> OP-TEE *and* SCM? What does the former do?
> >
> > For OP-TEE, we have use cases like getting the random numbers, remotepr=
oc PAS and few others.
> >
> > For SCM, setting the download mode is one typical example where OP-TEE =
doesn't come into picture.
> >
> > Please let me know if this helps.
>
> I think it does, but it's odd that OPTEE wouldn't handle both
>

The SCM calls are the ones handled by TF-A which are usually referred
to as SiP SMC calls. OP-TEE doesn't handle those SiP calls but only
the SMC calls in trusted OS range. So yeah both nodes have to be
there.

> fwiw +Sumit is poking at OSS firmware for other platforms and may be
> interested
>

I think this is a WIN family chipset which only supports OP-TEE by
default. In the IoT chipsets there can either be QTEE or OP-TEE and
the bootloader (U-Boot) apply a DT fixup for OP-TEE in case it's
present.

-Sumit

