Return-Path: <linux-gpio+bounces-35070-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENgPA//c22lhHwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35070-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 19:57:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0974F3E5451
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 19:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1574D3002D31
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2026 17:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6284E3624CF;
	Sun, 12 Apr 2026 17:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OP4YViH4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qaxo8b7L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089592F12CF
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776016631; cv=pass; b=pXdLQHD+xoOYNE6TwUPVQsaxkLxEnqQUH0Ia8WhzzmBVEuHXvm+Lu8/xg2ky3mWeAo7xiJFXxpvVPVhqdyMnwHZqkpD2MlWJUJD/nv5n/qwYdJI/RQMpH8VKHqJDrlS3+Iy/T/5Z0fMc9hIf362fOO35RammnCNQKglfhxP2wfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776016631; c=relaxed/simple;
	bh=HOLZOlV+M7mqQWApb4MkDtQJgVZ7IXsO9qDA1D6A5Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCpZjCZE0xK/BY6YQ9hNNnqzn9DIZ9vWhReBy2H73Bq5ThaQYmX8022pSNzc1YBpFHJf46urfixqUZEKEgcByULEd3+t2X08cotI8VSxuvOsgUDjZ/AbKaI6c27OjmsDePTbGluzM/2GwFFkZYpJwythc7esO0NJDps37XdSIfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OP4YViH4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qaxo8b7L; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE4jTD541660
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 17:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thQtqmVfOFcBFGUwZg+zw5IjO7y+NzSjPPe7a716jaw=; b=OP4YViH4gAd2pwHt
	tCOBnwBeu4z5tWAGGf5hAjQhsDSlroquvq4gEIxfEbAa4AnikdfrjQWjeLITouHc
	HiR1zhvIhsXpvEAqxgPANua/Ws8rZzmSJD6zpX3h6wm6uLOCPlIKxDyB8jv7Ey8S
	LQLB9VsgZmJFrXd61XneBjuiAPmECCkuOtgWXsIuWpmybpiaWbLhS925KeFP6YFO
	AlsmhCSMC1Xz6ZyfXgedrg8nbunSYnNM1kMlRGWuvKU7zwpzKJfTtm8/mTHdV9I/
	eZEcDezlQMIw/xEv4ofenUsjDerIFBIB9wNOYNZ+qSrVYJ6aya1LwFNTpFek/5wY
	/woqLA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfts8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 17:57:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358f058973fso3680732a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2026 10:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776016628; cv=none;
        d=google.com; s=arc-20240605;
        b=VneBPWRn8SaUx4/yuPFhWsIELlqP5W4dm9g+SkeHosRM2/wFxrIb0giWwqOg5mo+vC
         yVB84oGxOi4W7s3d+F9QZc2+qNqxbHKpC1RHnqXwiZjgV568s1mmUFBIondjB5g6mQgA
         E6PWsz6dhixaxqgKI4LQcQxGEYzUb2IiN9a5k4QXXG6RtYEZihzCKWIwPXZDeNosHTzk
         ukeM679iIPCoQz7x9Lkp4AO6OpCk3q7YdhOt0Xs7JZqXkRyyO7a2R8tJB7xQ8CYWb8Wd
         OMX1tldMphvBrExbMFROywVI4J3cA5lI+GTJIhkyndTO7AyevLi1JqFfwq+iXUad8xD/
         oY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=thQtqmVfOFcBFGUwZg+zw5IjO7y+NzSjPPe7a716jaw=;
        fh=NTkiBpI4JSmDFoeuDpy+wumLn2oCnDARwa9WFbHmHzs=;
        b=hnTjeC55xKLZFMoabK7n4XvKez9jGe8Q5Hl3tDaPHOZXtPmZDb7HIyyPAv3Y3j4MEL
         jsX0Sg/adcei6ykVzoydBEBF+p3uVjm0wDIJU0yKnY+l1M111CbULeodtKAbqys2ntRh
         gMa2F8HZofeU6l5gUHO09zJ8Iwgf+rsKv6FDgQRzPrQq5sUpSJ4YsFsj421VWWKrmP44
         mu9cbVI26kSoTLLIbL4PxKzDMykkpYWNHkryABQG+Bc4K4SqFDDyPCJaSXjzNyTMNKqb
         liHnND7wGR9cNMWte++uNp8NKEWlJ4Ihb0ufaDA+GVLPu5/vCE/Tk/49AQhmD4Ejfv82
         mo0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776016628; x=1776621428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thQtqmVfOFcBFGUwZg+zw5IjO7y+NzSjPPe7a716jaw=;
        b=Qaxo8b7LNAE595vvWVzEqfBL1vW+FdQFmpVYEBhSzuxb7RD/aSgNAwf8FFX2ZfGcO8
         gyjCMxlJVzLftPV7JElexruwUKxCwXMJI1ZudQtfraSpw+ghFhW1f+3IdpkcQIMb3YXv
         WuCDNMf3licJpVcdyCO36Q6UVWr4Z+r/Kdjl7cuFT5Q3meabZTSgKcz/gbWBoPh9PvSw
         M/nCiA7raJ7LZOajcwBGXvM40eAuIy7YXW6BPRi+/JKzdWMWJMGSRdLJ+BuquJcm5Wh5
         5Fbv1lmG173QehD4ov8wU9duNiyBqZkKFECLT8uZEky4Y7BgaqQczbaIz+AuK9Li32EM
         0RFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776016628; x=1776621428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thQtqmVfOFcBFGUwZg+zw5IjO7y+NzSjPPe7a716jaw=;
        b=K6wYSnogS05m7vjeO4OH123faXrF1Cdcm+Bp8Bc2QvhuvjBqz8t8KMG4n/Ay1dEp3L
         jkRwAnYwFkK406Wg+DlffgfHRX2XQNm/FiyyyZkXUIKqskQvQWxIYBL9+ucRPYSy4kPK
         DgaXOIToPF70S//+hPpdlkr03qXU0CGN3HFRbzmolnRw+xPPbJgcIq/2J41Jz+lZPRA3
         34Yatx7MBxKf5iMCKmzOO07uOW6LCB+QNhbTEdo3ypQrQDNfWmmYt+ObUK3288clRhmN
         713PvTD8cDRsD8LUWfyKNkfmFqeY4ScgFggzJkWdCw29edriKc3tKIzdsD768ZoeNdFJ
         wKBQ==
X-Forwarded-Encrypted: i=1; AFNElJ89KIozmMlPst5K7Qu5bO290FosKUJ/KDmo3XcPPG6gXjHr39/aDWhE6FJItQFaDXWyZNgwZqhmitNB@vger.kernel.org
X-Gm-Message-State: AOJu0YyqMmRyIseWSA/0EG/HrNI47bKa2dbIu0TudBEhMVGrYmRNTpMf
	Uvu5SlHajFXU2pL1JwPzL2nBbiDtVfynRPphuCArpOBW5CH40MKYB/OOr8Vjs3MGbFW6naKEWJ3
	RLhdQCTIfnUfi2WCy6JtNY4jH0lsBYtsrN3HO3z1WRjHKO92lgO9pPg/q2sKgkLhpEQGP489E6M
	do+65Exj8/EBgPuxWn7yUCMSadPwbfqx3/74MRl7Q=
X-Gm-Gg: AeBDieuFx8ToaMYVSnpSSFxlnPhsfmdM+6xRrABPdderRIi/ojWbdKMihaQn8irPkpw
	KB9QkWGXMbSTmgFM4Px36m4QTgxx7frBFdH9eq1Et2lfeH3xGIFZ/61dF7SaZKU0HZywQm7RP24
	9tt+zn1GkDO9Nf3A3Im48/rVQjmGRAURGNcci7NPBW6AZ+IkC88aWgZoIKx3Cw97/2czy+3TXHS
	v5120Y=
X-Received: by 2002:a17:90b:3c48:b0:35f:b9ea:8fa5 with SMTP id 98e67ed59e1d1-35fb9ea918cmr89832a91.20.1776016627716;
        Sun, 12 Apr 2026 10:57:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3c48:b0:35f:b9ea:8fa5 with SMTP id
 98e67ed59e1d1-35fb9ea918cmr89814a91.20.1776016627186; Sun, 12 Apr 2026
 10:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-14-5e9119b5a014@oss.qualcomm.com>
 <CAD++jL=jUd4sQ1bhwcBRYpFFApP6vdJw2BoQwxoWShUKdEb9oA@mail.gmail.com>
 <z3obsnbmdvvlzs3cxm57osbax4ivg2zq2zk6xgp37n4hni7y6i@smwn362nhn6a> <CAD++jLnXJKKv5ghRnCcMTU9g984seJAMHyL6VWWV0Bv+dv01wg@mail.gmail.com>
In-Reply-To: <CAD++jLnXJKKv5ghRnCcMTU9g984seJAMHyL6VWWV0Bv+dv01wg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 20:56:56 +0300
X-Gm-Features: AQROBzBYY7vv1cLFhlrg6piWW1-Z80EzCE2Hx7Xxi4DegOE8nD2ShaZfoDVqJb0
Message-ID: <CAO9ioeUAqG5uPs97ZAgzEfQVTW6OZWsCpAfxmDP4YUhjYt8E1A@mail.gmail.com>
Subject: Re: [PATCH 14/19] drm/panel: jadard-jd9365da-h3: support Waveshare
 DSI panels
To: Linus Walleij <linusw@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: HFTkNLEIfX6gnW7PuA0UNIDV6PMGRM0a
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dbdcf4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xwq5OVEf12Z6bUwLnC4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: HFTkNLEIfX6gnW7PuA0UNIDV6PMGRM0a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE3NiBTYWx0ZWRfX37JZ8pXk/M/a
 0bnzc72REZ++zgOQxEPmZYbpaeTaBqxc9yLMuY8i5baIAs3QchRKKco6oy/OTXYLaB+hLUEw6Fc
 7kpiHWp87BU1XDxUB84YZBqkzF+efGJYfKySlbfl2ZvVN3INIagX+0uK8t0r2tYyc3pS4L8uah0
 aZzGoMIYHJoJRCx6LwE+/Pu1jSu9uVE7o7lOwlNTPe5wpITWnLofetFXWK9mBJ3dMwGb6XW4hpM
 jhZ3/9HRqqVfeFHYVXdvneSLNDtGPcdto8Nqar/uL+P6r7rIQJ7Frc2XFYlHkVReoA/DJiiESM0
 etdFnwnnv9y7/JgZZO2exWLcUqt6M43PxpJ+Zpp4W4D9K/eO+FiX8cjsfjcWZGpJ17k0/xDVyF2
 MD8HxIf4kPqXChI3tHyrbKmqzWU60tEP8Q47AFydcFgwU3CeDsCgvNeYhh48ZgVG2wvHy9DKPzC
 VMMLnUnlrZpWSsnalCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120176
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35070-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0974F3E5451
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026 at 11:50, Linus Walleij <linusw@kernel.org> wrote:
>
> On Thu, Apr 9, 2026 at 2:49=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> > > But there is also one more thing, this looks like a big "jam table"
> > > with just register+value tuples, so construct something like:
> > >
> > > struct jadard_jam_tbl_entry {
> > >         u8 reg;
> > >         u8 val;
> > > };
> > >
> > > static const struct jadard_jam_tbl_entry jd_3_4_c_init_jam[] =3D {
> > >         {0x00, 0x00}, {0x01, 0x41}, ...};
> > >
> > > (Ideas taken from drivers/net/dsa/realtek/rtl8366rb.c, take a look
> > > for code and all, you get the picture.)
> >
> > Few months ago the code was moved exactly in the opposite direction. We
> > added all _multi() functions and made shure that the code is as
> > efficient as the register tables. On the other hand, having it as a cod=
e
> > allows better control. E.g. handling 2/4 lane case would require extra
> > hacks to the register tables, while the code handles that without extra
> > hacks and without loosing effectiveness.
>
> OK then sorry for the fuzz!

No worries, it's fine to explain it (and also sorry for me not being
able to answer your other questions).

> Reviewed-by: Linus Walleij <linusw@kernel.org>


--=20
With best wishes
Dmitry

