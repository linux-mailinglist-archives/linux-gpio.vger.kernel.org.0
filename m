Return-Path: <linux-gpio+bounces-39269-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dqhWBN7ARGpE0QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39269-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:25:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3246EA9C2
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:25:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gf9vcwty;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bNpoiwaj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39269-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39269-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F7F1305A8BF
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DAB3B5F63;
	Wed,  1 Jul 2026 07:23:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26723B4E9F
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:23:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890582; cv=none; b=LEHr0zMpdKPBcw7tih3ZSv7BT8MvfEsdhaiiWKxf9D50BvwnMG72/o0yEkBVIc3PbIuGAKOs/2cYT6W3a5Z5PFRJNjrQseQlrN0MsxRG3qAjLUT0+1ST+hthQZBActxwG2wl/RywAp8f7IX9B8ZoLxAfdnISZloNnDrxWo6RZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890582; c=relaxed/simple;
	bh=FmNuiEcJ0CJ3m91yAlCmgIbfwHGcvm53r/0fIr+/xPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jyb4u0ReHXyxaYyPuLZexJtlXOImTz7alKKnESjb+2xa1JLOaKULpTpSuCdudoavxpsamIltOF7W1/v0KG5ZlBQ3GcQFyo5KBHs4yvRgshmFkWH0oVdQ8Zq8RQwUEibzlANInjqdIqe5d7Yn0yQBKOveBANp5PoyNYNSgqqTHhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gf9vcwty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNpoiwaj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lWts059179
	for <linux-gpio@vger.kernel.org>; Wed, 1 Jul 2026 07:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pi9pQoX/NsXvEui6QP9+qDiV4dR2+HdYb6pn9s+nv2A=; b=gf9vcwty9SCzhRJU
	5ypVKXKFnGoxTCk6iv4HgyLfYEhwyTKm9jcg+BjrWepoUqhCdM05U74YsczkGdJa
	7ihNpsAmwWPkTxhYeDrMHLZWWB2Vhw8bcvWf5ncxZLElJmEWpgcvuDrCHED4GJ0V
	3Lli4+pxWg839V1WRYEKXYT+o5/vOvoOqgr4gN/BNDP5xA8ORkYNrGBNNb432RY4
	csR7TmPs56G+Jrv1ZFbY5dxFJGin8fiWR/wEFmFRo/wbqbO9H6Ag8a77Yu/O84KX
	8qI3ncAnNA2GIXCKAqGEyn1RaIy7rwlqxSB1V9DPkFNCPLqcPRqRKMp1jEHW0uWL
	tRd5mQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sjtcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 07:23:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92aea0d801dso37948985a.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782890580; x=1783495380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi9pQoX/NsXvEui6QP9+qDiV4dR2+HdYb6pn9s+nv2A=;
        b=bNpoiwajz6DN8VCL1lbIsffPYgS/bb8nRNYFxSiiertmDHVKjlbbEyQX48ln2tcqiV
         ClesgKP9Ryi4/ScHIHHWvrTKwsbtk8cKvuWlCvEQlqu+v7SJINAcrO6nK87qBFQizAf5
         dWJ79sydj1OC+ZmdhWz/cGXuSh+5o3WKLp7/2FE0E460bP9YDaeFDT0M/k8IEWpXFyDy
         QyuNYUPoXIVxL2sbraSoOnTo1yVvVi/uHQANu8Mu3dxr5TKqAd1BkaLSrDusm55ccvGP
         IoJPjAN6NrUpcrZV1pMV9PU63y0cEVftBi4wtLqx7bPVMlpnLHixOCJxhJ+jsWRWxiGf
         E82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782890580; x=1783495380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pi9pQoX/NsXvEui6QP9+qDiV4dR2+HdYb6pn9s+nv2A=;
        b=mVtScjFL2cvG4BYLEXKQIRoOsaDHctqOmjzN5wxuB5MCbPk9EnzjoPI/nFFAKXhE7I
         Prk7GF3KjZrgVSM4oygnMymlen9MVoMFy5b8li6MGPxScgdFG0b7wVJUN3ResV76WQmM
         Il29mkPLt996Y0iJprM9w2m+RsRR56KheJHAdH9eCA9yUQDhOvcY2qPmLDtvsnOGGARd
         WETk7iEfWGyZDXAypNOgho0SbNuLscBPp0x2vN08RrBw+8D7pYX2Xcldv9SwQ9rYnQW0
         HjomT6hyPOapyagZz8QNM0Jg+NJCAGAjpy6Mu+rwa4m3fuYaIDs2UgoDV73YQqLqxnQo
         S2HQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cr69oWsK9vfx6Y/VNh3RpNCYohajX2Q4lIGk6zBUx/IWbQlcSALBTAN+hVNcFBNY1Y+CMqoSaeX6N@vger.kernel.org
X-Gm-Message-State: AOJu0YzVqukYdt2oNXM8EdrpFWHfLgo/dP7R3Zfydo/ux8U4qpBcUH+A
	JB7v0GGiCTbf9qKaXI56hdQmrbsnE4vDTbkSktD96etAVVcKz10ItxeL/SA7qRk7MAnuSgO6hnD
	TjL1lSoveEeULqfWrrdL00jzu428TX2v2UV40ZOJGR5NV45vh3erLlCS1HQnv3J5K
X-Gm-Gg: AfdE7cmO2dLybfpmd6SCZqwDqV5/v6+HugLUxXr8Tok8zUHa0q0nxjpK3DBq5IWG2yV
	Siv+9TKWcIiV5gH/VCipSo4sFWUHlI3jEOS06xv5npH3Pri01Z+nVoB7ezRit+jtHiPQHxhf+Z9
	LDALLj8Pg+5d04Hiixs26dWxpWXwto74NEMwlWNGj4iZ1VRPuGTVB69NqnFhAEpxLBlZQ5Hyot7
	b1UnrsGHBgPAYddbrec2qLnCrD0zl+srLt7s7QMP0E9ca+iTHFx6mgcz0/v7lA3+pndWGOcYzXM
	BJtPZPbrOIZbNUseoqsshUcNV2nOXnzFjO6ykvGwcOXU1Cq2LoJ0eN+MepYYATJzzm38SmHz8dg
	72fXEGAQmnCLbZ2L8d5EG/aFk2Hh5cRkJhqnmooU=
X-Received: by 2002:a05:620a:6008:b0:92b:4474:76b with SMTP id af79cd13be357-92e782b6d68mr68437785a.45.1782890580086;
        Wed, 01 Jul 2026 00:23:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6008:b0:92b:4474:76b with SMTP id af79cd13be357-92e782b6d68mr68432885a.45.1782890579274;
        Wed, 01 Jul 2026 00:22:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4718:fd49:e3d7:676a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4c7f2csm63320905e9.3.2026.07.01.00.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:22:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151
Date: Wed,  1 Jul 2026 09:22:56 +0200
Message-ID: <178289057140.4734.13129824794645895318.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626-topic-8280_pinctrl_wakeup-v1-1-2ccb267148f5@oss.qualcomm.com>
References: <20260626-topic-8280_pinctrl_wakeup-v1-1-2ccb267148f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iAHMFiJUWxBPvOKHxrFisspldMJLVWWr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfXzzNqAAGJn4tg
 aqIuu4lDDhcAl44722pRsl2haJ96wTXbqbhNpUNjEHYFSWVqo13q6uySm5qCE3Po5EeQbmh2ebB
 lBxtX9bnHFsvFnziTXZCUjQOAwzE56Gtru71NlBMFqStM+1/oJY1QmUG7KbmmcSvz30Ewzi2IkK
 L5cGse8G5t06uc5Dw4+84cEm9RapXe91ESG0f90D5xEEwR2bZs0bZImM/Lduucur4NnW3Vuq/5M
 SfpZ671ekq9hGdWdKdX65DQ672GAKKEGcAjZKCzzkXKm+zwykh7F9eFfv78f5sfudRFB67KfdHN
 DmzK7b/rVXwrR7PfuscCBBk4snO+9vptwi0IeAmSndVHXksXfNy3AIhkxzXBd/ml3jx2uaFlbVk
 vYyKEjiDIdG8FZOHlmtoRYulScXiFY7RcikCAzIBr2hrwnAmLIkrtCXbOIXTNfAJ9KlQjCosbKL
 nbQh1akAu1CZ+78sapA==
X-Proofpoint-ORIG-GUID: iAHMFiJUWxBPvOKHxrFisspldMJLVWWr
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44c055 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZcMVcOS4toDr0kPm8O4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX7DXuUskiPbDs
 zYETmj60S/KKYMEdN6mkkCctnKhHxA9xSnCvQoLK7Ov2VWg3f4Z0e+svKTgxWfhifX0A+akfBuQ
 GUvKHM1rS522FqOyIiyR4/MLL0fN738=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39269-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D3246EA9C2


On Fri, 26 Jun 2026 15:08:05 +0200, Konrad Dybcio wrote:
> Pins 143 and 151 were not included in the PDC wakeup map. They are
> normally used for PCIe2A and PCIe3a PERST# respectively, so they're
> unlikely to be excercised in practice, but still add them for the sake
> of completeness.
> 
> 

Applied, thanks!

[1/1] pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151
      https://git.kernel.org/brgl/c/437a8d2aa1aa442c4a176fdf4700a9b3bb0c8794

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

