Return-Path: <linux-gpio+bounces-39953-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qcCOJASjVGpnogMAu9opvQ
	(envelope-from <linux-gpio+bounces-39953-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:34:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA27E748BF0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:34:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mubL5Dtc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O1CbeLl9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39953-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39953-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EC77303E2CE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 08:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FFB3ACA64;
	Mon, 13 Jul 2026 08:22:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8FD3AA4E9
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:22:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930955; cv=none; b=gghDMRyD+SPfH8nl7hwVB+Ye/LjUS2I7iT0EbhlFWehDI/bV49hDqgDmFL2ipc7eQIhgZ46+kt8ahmFoLpAtdJ5Toa8YvZHOatdNWaSG1VC5u8yrAE/SYLymvMAeoaQaJmEIpeOP/ItZFmIl2cI+E0q6dzAS5sHszMMjYQ+Wu34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930955; c=relaxed/simple;
	bh=bxRMLXmQHwXLglGw45CZyj/G9zrvnc8zeYpRSzODb04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNtnjv6SYBT0RnZrFN3VpPkbNLfRwWuKgi5BhhA/XcLoT/COnQD+/PNlpBAFrosDv+IO+iLGaUlvBop8KO6wcQe1DGMh26SwSlPzsvT0R7FpkBZiWmEQPZUWox2wXgz0FyTpWuswCVDLBH1ofG7WnA7vgIS40fVAtlgYSMlyN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mubL5Dtc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1CbeLl9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nk0F668635
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taDteVqnZDMlnEbdgnMrSoFaQv4SalG2UgotBTSbtqM=; b=mubL5DtckRzWngQ2
	CABDPvM2DxPzWXXoh63RJ9lQuh5p7AdUWJ7TUW9KzYEjFfKdlt/ZWEDg8/qlQm4X
	p9ZN+R9R4rDKPODdBtVOBWKN2k2EeYhI7nZccAVWj/H/9t3jga8hNSu49xQ9TGdT
	8lW8b8Epj6YErTp1Zxp3VNfVK06qzCFiqnmvk26r+lXs5r+ZdzEceoSyLRmbqVbh
	SB+8IsuNO9wiwWEXAGUoy6cMV/zLfhTcTHoouHTJvi0fpoZA13VBQtEF6OYOyA5h
	BICH1QJQKnPUqQLwcs76+X1AWxzi4jmYKS27bu8pB3M4ZKXLGJbw6B17NQsAv/Ut
	aFevOA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm1mkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:22:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8b0a08d2so35278781cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930951; x=1784535751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=taDteVqnZDMlnEbdgnMrSoFaQv4SalG2UgotBTSbtqM=;
        b=O1CbeLl93za+muaP+EtRH5u3PbqakORFgUW5tCflj2jqy8dRhpMsMQJLjrhlcv1YWn
         55VcURsMdks787ddvD2f4cTLVxPuBFEXVUoG+DTNN7jDvmxUq8v64xZ+zy/37nSdmopx
         MnDUxoGD1t7uJQEV88GTV+a+WBxHx/6QmUYDthG3Zp3CPrn74NTxVh7n/iGGGUBsIkxZ
         PpkdEezLqaij6MaX7W+yt346VS/duCxju5MaKECeESmbLk9WtCXTTSh04YHftpjqwEpG
         3xkhNRWmVApy4duPK4pYRAijCwK9yhO//PMi6QL5/3xfcZV3gG9zKDUn/2zJgYEaKuNc
         D83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930951; x=1784535751;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=taDteVqnZDMlnEbdgnMrSoFaQv4SalG2UgotBTSbtqM=;
        b=Logq2OvqAmKn91ZMcW+2XHPh2gpf6AlDZzyJcoPwub3pd9yqrizQNhqBgkd4uJqeNc
         oUAG7/AG1MjVlTXR+GXeSwdgaoVZE12i47nEwU8ZF1lXXRZkaanwy/5OPxHt1CF4rp9T
         v4nb/NFHIJ8UWHtHtuON0JmpJ5AW9TA5ZQMLl04uFVQpru5KnHw5kiOL/6ROd97OM+vU
         SVu148PG1kYJtxzHOWKlZQe9iACTuVTouX5rNIESqmN/Zkoj7ilfnBYOrgdk/ApihAzj
         drLDWnXwbJI4szc2C1+/oc6LXq6wwLQy6M5nu5Edc068GHOIIyDlxLiX0Ce7VS3eujz/
         cung==
X-Forwarded-Encrypted: i=1; AHgh+RpTAoVD8qidARcjyFWmNq4Zt1IDh8LTo5CkrAwSbY66X3z5pnAOhSBz3DH4mdzdkTpTqluLucORL9+i@vger.kernel.org
X-Gm-Message-State: AOJu0YzD7MsU1Po4cQz0Jmlixjxg4JMviz/FaA2GmvYMcBCkMRzYtlxs
	V/Sc214gof56ICc/cCxQwYDFEikYrMoENvb9uidtak/Fnp56bz1GHHK90NhmAVNRlaTb68Jpsya
	ZmpXh8zZ4NC5uYpJFhH9PVovvjq/2pPH2Wsgkk6SQVXzsO1X8IL3g8NgbM2+MiLqb
X-Gm-Gg: AfdE7cl4Wxc08vfRwdFFKs5imogo7u9VhvmC+mfpVCI3u5oFi9nOSOlt+GjKBHnoJGK
	o5ZWDqMPhYwPVbRzRRmdLb9Bfip1pb/vs/WoiHjxzFmjgXsahhQEEnGqjm29lMjOa43/78CTWgW
	Bl77ZbnYop4sCeZEgkYLbWlluT5p57acc/ZRi13JVZ9/JCQY319Eah75ilrIMao92jlqviSDlx8
	+y217T1R/EMIAZtMUdlToMnUZrE4N5Lf16XQ/uscvudqRA7TG3YFDJXvee9A5aGTEU5t9aiZzGj
	EAVpACnlOFzmHyrENojnTgqxZ+OLZPryXtlvMSzqPbdvGpWhBxFhOZP4NybQA3pqL4aQQbtcw3q
	P2GOCyxZpE/4YYPmantX9iyuAUhItKg1AGS7n//w=
X-Received: by 2002:ac8:5ac4:0:b0:51c:7b13:62ff with SMTP id d75a77b69052e-51cbf380b99mr72834611cf.85.1783930950822;
        Mon, 13 Jul 2026 01:22:30 -0700 (PDT)
X-Received: by 2002:ac8:5ac4:0:b0:51c:7b13:62ff with SMTP id d75a77b69052e-51cbf380b99mr72834501cf.85.1783930950429;
        Mon, 13 Jul 2026 01:22:30 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm40344350f8f.16.2026.07.13.01.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:22:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abdun Nihaal <nihaal@cse.iitm.ac.in>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the buffer init
Date: Mon, 13 Jul 2026 10:22:27 +0200
Message-ID: <178393094383.9372.7978842835455605078.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
References: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dQVA5Lnn3yywiokJJWEs936Lmh6JP_85
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NiBTYWx0ZWRfX4OrvQns9sTkB
 i+T3238JvJjayYg0b6tC7qVWT7nGUY0XkS+t1dpJgfBlHDHRGNGQN0Ohtw1SYYGmCIlQrqKx9H/
 SUxSbv9zMfkqpif2kYQsnuPA3Vzcb3Yp7zf/zPxXHsQYmadF2vIubLMTMfKBLMPiGS/dnqGZeQF
 DAFgiZulG2HncNzqRdh6I/6wo38EEeizinEyBbniaK8orODkNFFZREKe+tle+Agjn/SpaCLt+mm
 PkAt2yfJZDZLK8kOEwwzRfT3jcAuTqNxDwsQ4IzKeiuGHSQwGMxIF8Fa9NLxPmxMSXXiSK9dEFJ
 OpSLP8AH81PsXgb6YCs8BIYRWCrBVHUIwVGtVXah7Z8bC331KK9zpcGrYSPYeiUmXT3mzqlqck6
 V84tExN45p/1M8kH85DpQbIK2XMwJ4uhw480PUvrpOPXN7Ek/i1mI5PaOzsyE2gcIVkkSib0QtS
 TunRyxeWlWpMPakjW/Q==
X-Proofpoint-GUID: dQVA5Lnn3yywiokJJWEs936Lmh6JP_85
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54a047 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=L2B-HX8WAKF3q-jLy38A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NiBTYWx0ZWRfXyrJgTJR/eV3G
 b5SN9qhZJ4vL8D9yRBCRLOCkqJPjpMydBGSYOdHKxJm6j0plkXESmMIBtIyofSZMtLCN8P8Crwv
 kuJubQ/tNffz2U4es6Yf1K5nMuSt41I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39953-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:bartosz.golaszewski@oss.qualcomm.com,m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA27E748BF0


On Sun, 12 Jul 2026 11:31:48 +0200, Wolfram Sang wrote:
> To avoid more false positive reports of "leaking memory" when
> fops_buf_size_set() returns an error.
> 
> 

Applied, thanks!

[1/1] gpio: sloppy-logic-analyzer: add a comment explaining the buffer init
      https://git.kernel.org/brgl/c/029023cd5c4b75a598e34fec9e48781761c09885

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

