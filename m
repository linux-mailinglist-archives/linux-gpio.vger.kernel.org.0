Return-Path: <linux-gpio+bounces-37630-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BcbGYUFGGqdZggAu9opvQ
	(envelope-from <linux-gpio+bounces-37630-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:06:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ABB5EF338
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 11:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5F713018752
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 09:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D0039A06E;
	Thu, 28 May 2026 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UE59xjRe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeuL+mDu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343E539B49E
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959003; cv=none; b=WqUFvDNyuMCc2otMsftFWxP3Xe6I3gnbiNWVFWolPHHUgP6Lk2RfaQciRBta6blKXj6edBmuGainRCKBGOUgqP3iMHDQkazsczzF+W4CrYr36GkV3Pl+FS4MEuRtjykBJaveh+MUb/6xm5xnUXHgV/IHMJvMKK3PEpVsz6oYQe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959003; c=relaxed/simple;
	bh=cZyB073d4IfFxm2CnKhqOxfSXK2fsb9fNKqm2vdsAXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jizwBx8JloiDZIt7jSIK+sdJZ08zGRItudGuWTk17+MiVTLU8BmOtawdz9PIobh4w/1PqS6IpXpZE0BuwRYoPSohhW+rJIL3oOEy+s00cI+Xp0cmERghHb/Rev//wU4+L5WkT2zCDduaq0KxAbx5MrR61NBqLi2N6ybCNQNvvqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UE59xjRe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeuL+mDu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8wN3N382558
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 09:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFx/oGtkiSVKwNAMx7oilgyXvWg2I433ziztP7awOKs=; b=UE59xjReUss6EJ6C
	8CxvwX+9wlhyOe0TH4fojs3Xk4KmzBn9duukiroH0h0DQ4FfrPY25Qar91M26cK/
	ZSVRkw1xQHZzkhdUdVXoylpvlAuCoXR4AdVhGQdD215+e44eUiUib2y6Xxx0AJyv
	5Hj6O3GCqV5u3+x7nJ7p5ItiDgA1FJ5eif7K7xBZIjwWZ4jc6sBXqyvDROE1Gc1P
	ooTAJ8YW02GI5QY9/8iXymxM6b+rZPPlu8GNumZMMPnJGPBes6f/4N7dmn+dQ3WH
	4wNoqN0e/137oy7gNuKn3ZoRGfj6vPqVukDevQrIMz5o0NM6Y5IHTndVXX5n13p1
	SUVlPw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrj48m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 09:03:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516458449d4so15036521cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779958999; x=1780563799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFx/oGtkiSVKwNAMx7oilgyXvWg2I433ziztP7awOKs=;
        b=HeuL+mDuZPyx/K8/awpaDQunZQLx+CRReRuiOGI9fctZLtUe9tyL9tscR3WXsoKsy4
         QWojo/pdpe5Zuw4yW7YjXOYU/4eR2leGgP+5XSMCCfmraZ62Ota756JiEuKFroRXqmcw
         e9L7wv6Q3f8B2GSwHQQ9OxoufNmUA+HtVbLKrfEl22giFihZP4JbDAbjalIvbT747Y4D
         ZNGfzPI9gZ1S7UYHDsVS08euGtkMqg2O0Cv/W9merKOdTIqLR7quHzzD7JgdLpayo62A
         iqiS2d6oAX8thx0WC3Etg1xqu38izAAkNgjfombUSqNVv89Z1UACXY29Kv2kCF41qyIs
         Xd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958999; x=1780563799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nFx/oGtkiSVKwNAMx7oilgyXvWg2I433ziztP7awOKs=;
        b=Bzb+nq48Dvy9KCwD6dugvGZjYl4nP2brFBt2vG7RNT7rLKtKHGAn1fd6nsSc4XeF9O
         LtoPk57e4GfDdJVvPV3IA+3oQx5FhB20J+S4oFIl6tcDm8UBTy3zLF4m+pSOqgOaTGxv
         0UNViQnEZR7PJbpVfpwxJoapeyZilK74RRdchAtgLr30Sv1xt1P6hPaIVQaN/9bIV/Tt
         JYG476hnLXqa0F29TV4tyV7BQUllFj2P3Sh6zFWyPrA+0UHzl7q2/35b7gONefW1WN4N
         qgcu4BF/D7ETQh0rM6ExhuHyXpCmdmdGFliWqs3MXlOMxFrxNuZPVucxJ1UeagvH4Qbj
         EYkA==
X-Gm-Message-State: AOJu0Yy0PaBwiBL1hlV2j56mQtVQFcNKoTx5XVtCg9GozCjH90/kOlfh
	FE/Mh6jAUQHwbqp9rUbqpfHf7eX50WcpR37+FRq5Ut/lHvdzhDjK0EeQvmi2/C+B5QO0XJIYRKT
	Na4xRSpTJ+8jHEBZKaD1e7mBY6etxXLGvAGh0w71LCglW+EWMI08IGQcmd8FIHH3vG18cXBhw
X-Gm-Gg: Acq92OEMqWCIb7etBEyMZSTsYvqRoRUZCpe4ykDIoZlBt27snt3r32AsuLAG/k4EQ2w
	GWtR+MPTXyxpgaMo9lHftudqHToVuicaI4kxguAdZt0wQN/uFZLq2/yDQeMFxxfVJNX9njuUDl+
	rzwNFaSncptgfyzwlHV5b52BRHVK2RZNHffnLkgQwOhGOA20A3SxdWIjnmReYfXj9JZqthjzCpg
	liHi1VHNwo9vw7aspyBrvzkD38cdtM84xRL9czlVxiRmyexPzu85Y9BDtl3+I9PYySqPAOPFDq5
	NF0k8LVn2jj9fY6y1U5qo+ScaekpnFBqFxezKDJVvUTkbUudA+k9NruVjtPxcxDuxHRgG0HPljW
	UTrC51WwenFDjP+bIKIkJEw9+VHwmyUsI5ajxeB2gbfV99Y6/Y1gzw85YxFS1Wbxx77hBqM+vGy
	r2J13UOiOoanqEcCrlxD57Vi5cPA==
X-Received: by 2002:a05:622a:291:b0:516:df5b:432d with SMTP id d75a77b69052e-516df5b4a11mr308138981cf.32.1779958999102;
        Thu, 28 May 2026 02:03:19 -0700 (PDT)
X-Received: by 2002:a05:622a:291:b0:516:df5b:432d with SMTP id d75a77b69052e-516df5b4a11mr308138581cf.32.1779958998733;
        Thu, 28 May 2026 02:03:18 -0700 (PDT)
Received: from brgl-qcom.wifi.ville-nice.fr (62-193-63-110.as16211.net. [62.193.63.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b2bbfsm12782887f8f.32.2026.05.28.02.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:03:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org
Subject: Re: [libgpiod][PATCH v2 0/3] bindings: python: add support for free-threaded Python
Date: Thu, 28 May 2026 11:03:16 +0200
Message-ID: <177995889953.21453.5228196037949306802.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260527215922.18678-1-vfazio@gmail.com>
References: <20260527215922.18678-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA4OSBTYWx0ZWRfX/afo1mUe+JGK
 gwO+XKat7/4onT0NVDrnM0boPw5md9p4UBQbPHhSxewH49gD/MCfUu0bzZW1By1nzFuFpG8kO1Z
 Qk2mQ2QR/fgiUU7B2JRcwUpAecm6cvc0iUNc0iBhU3ITjv1W0aHIrDuHXCFcbgLHV5gYqN9tS7f
 LRI1J2ew8zCjZre1VJbNMu7+1m3c2+HyByWOiNh7NK3WlA1LyLuX/sV1bIMF+9xXgjnfhdt+8db
 H2m6y8V3qgIepa6CKCUoI6dTpwSM4HKrhhWUcbPxTGJc148SGI2e02HsM61pQfNCGTgKFGMm2Ww
 h9OcvnmhtK78xg6hxR8+k+8rDfywIoUq21zqBbOONLmVCS2rED4N0Y9Bmm7irCKovgulSWQDtJR
 vhqsBFgGVlakIZQIc1TCvNCZ2i7d3kbI5fj2XUAHSOe4T49jf6OReyQegeNKyG+rUPL7oxcub9G
 Fa8wzmcqX4NpivPBvHw==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a1804d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xizqlaZpAqmNt8UN1ov9oQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5s_MW6SqwniMt_je4_0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: elsGkn6S_D08Tq2CQkc0TjT-tcQ3_oSb
X-Proofpoint-ORIG-GUID: elsGkn6S_D08Tq2CQkc0TjT-tcQ3_oSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37630-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0ABB5EF338
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 27 May 2026 16:59:19 -0500, Vincent Fazio wrote:
> This short series adds support for free-threaded Python and adds a new
> test suite to provide some confidence in the suitability of the bindings
> being used within a multi-threaded context.
> 
> A changelog is also added to keep track of changes between releases.
> 
> Note:
> The new threaded test suite was run on multiple machines in excess of
> 1M+ iterations in an attempt to make sure they were bug free but due
> to the nature of the problem, they may not be absolutely error free.
> 
> [...]

Thanks Vincent, I queued the series. I noticed what I suppose is a rebasing
issue where the copyright header in the tests_threading.py file was added in
patch 2/3 instead of along the implementation itself so I moved it around.
The changelog also misses the SPDX header so I allowed myself to add your
copyright in a comment block similar to the top-level README.md.

[1/3] bindings: python: tests: add multi-threaded tests
      https://git.kernel.org/brgl/c/9d8940f38f6e858073e7f144664ec99061c71831
[2/3] bindings: python: support free-threaded CPython
      https://git.kernel.org/brgl/c/c9378d6c636abe8e5eb28dc71d49f8dc45978396
[3/3] bindings: python: add a changelog
      https://git.kernel.org/brgl/c/c0650edd4417bcb74e294ee2a1dafdc6ea594e9a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

