Return-Path: <linux-gpio+bounces-32022-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIS7IJ4knGkeAAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32022-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:57:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE74174657
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 469E73003608
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 09:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C30352926;
	Mon, 23 Feb 2026 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ea8JIpnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxCKtmro"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF9C350A3D
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840649; cv=none; b=HM0IjcXtXsSY/MWVGfgFlNSfplUYHN2Fj1Nb5KrFiBU6qCmi2rTuNpG7UxPn9hpmVBuEkFw3nSZeEZvvYhbqmpfrTWyLSxRvBNCAb5J95CimE3yj1/FSBzRusMSdHa5v4pObXJ2ARAx6IDULcSMxbK0LGjPBeANb/sqmoaXsD1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840649; c=relaxed/simple;
	bh=sgTcrIz8/57YaelUUtgMkCMiGtGMHvOeTdfzKvHscOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G+Q7iK0aBTUD/fZYGzPI1t9dfQSd48mkJ8TbBqbbsYxA8SR9PidGKtxhupfT53jSn/pSp+pW0mKMCpg1DohGkPYkcIq5rLtX7hgrLI2D3E4idYWXd39SNmUOm9z2Vj9dus2XdPLExwZoNNFW61d4/fCpywXlEX6TyfdZntujwOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ea8JIpnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxCKtmro; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7WDDD721346
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	816Sh786yhFWvfzS6qSZQb5Zh/eco5yRAlV0CEP7CKw=; b=ea8JIpnGPcxR3KiC
	ZOJk4yurhJfHQUnIAxpahhagpU8a1P7yg0/E+4AN0qvJRCRc99WjXYqCH9cwl6Aq
	BP2pq+vVVYiV9R8EgJttYbhRJSo6m0lXIZrMgOaxMnDKlBvt5B3U84f36Tb01NKA
	8OHMtRUkGLaK9zZsLNAW9rKKZNhZ9IfS3VV4QM0lBeLFmaNVpGpRIDEfyyEvzoQl
	64YcUk5GEY5VXuCBDB7U2ane2SsD7VbiJOTrSOjLId5/KACIQu07we7Wq3jTO7kf
	bo2yahSjZZ/+la/UziHjcYFLU8cknHcDyStsx+qeiuk52q1aaFey6g6Rz1DFj9kd
	HZSpXQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbc90h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 09:57:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89463017976so503580316d6.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 01:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840646; x=1772445446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=816Sh786yhFWvfzS6qSZQb5Zh/eco5yRAlV0CEP7CKw=;
        b=IxCKtmro7fnYj1SmhMFYYIGBcgYWgKiKVav6bLkFa6vrxdI4KIVZEqDgQWeAHrmKJr
         XOyFr/b61tfDctyEXE1H4wPJl1oP0nb5SDyvF3yY906vk0xXXJVN/xLSGt52J0rIuP7v
         TnH77li2l7fc/lj+kBwiBRi5irEkJkd/Mtt1CCeD82hA+T2ZZz5JsBCdQbwNslOmfWWx
         I68bwcRIahEvVX/GPVQ5V0qkixBb2ACkh3a6A2tf089S0LmDVyjTPm0nQASYwDZI/wpL
         nMCXnVD/b0l/SY6zpaW822o9nRrf+pX4tVnDI7sRiyDLGVsqIJ3loUPxABzw5MXONHR9
         pu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840646; x=1772445446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=816Sh786yhFWvfzS6qSZQb5Zh/eco5yRAlV0CEP7CKw=;
        b=GPGdmhTAuliWGlusupKg1HG+UAKQ5buewdXjGfpO9lrOyt7sjNeh56j/3C/Lpvuqbj
         uj+g7ugtVL9/oNbFz7BDQFZ8hMmePfNKhmzua/BuzUwLNnMMCXLjxB/vA0xiLXG0x5pG
         5QBcDmq0tmeAFQPH0OU9qr2j7NPNQH1XvfG9JASxFKGNrHWW2Xsv8Eh4onje0J3zl4HN
         sQBCf6hBcmEMeele9b98bfxoDERKQaUxrMQIAlMrEa3qD0bRRuOjH48rfCupxvpt5DHH
         vAQkuGYMr+vJpm9c9vBNWo7y3+cC20P20laBUeATH58Lq850cXy5rO58+/Mh5fOyyhRb
         wmAA==
X-Forwarded-Encrypted: i=1; AJvYcCUAsrKjNtrnmRQ3Coatm2c8KnGJxgfdNmnAvFk4LARFxdJLmXYBYMeqm4EU8RPLxdAykUn1rDi6EoyA@vger.kernel.org
X-Gm-Message-State: AOJu0YxCxUdUWa5rPK5pvrYz9YNSaXP1upvmeLTT0eRp7lXTecrHBaIz
	Ilxumercy+0m63Mifm1QNL2LysTM3UO81r1T0u6eHn6vyRRRW78etlVml7tMBdpH3p4V6+La3Q9
	VS/rgTz/a0v6Sltw0a7q2cg8S0+TinNNsoaiqhFMagVQn6G1yE3Ta1Z+t5k6e8hW6
X-Gm-Gg: AZuq6aK6KTU3GLNO3qO60YxkL9tDIwalACCiQbj/1YTSJBLLfKVe8JPYYqvr0/mqOOt
	ulEtdEE83Waj/idkwjr1veqX31NrYfEEXKAUkKxFTXTFbwl354hu/GrvOve9qSEmS5WX9ajSZw1
	1VFAUGiNT0TnquxIObqC0gokGDucuqviOgQFLlYkm7UPyrNy8FA7wEMvCBFOckm5+z0NxdOT4x3
	c1k2GUi35NYWwgDk/6MXCFhapknexGbTtLwEU8F8AI2Oq/Oc6kcka4BerAmhdTuMLp+ZNCkLjmO
	+AKAk5Ah7UT2jytCOcL5FAYPWU7BYYHxm2it4NIdbqKSJvvi4NBqGiF01ecp6lPRgqvBNER1OST
	yBtLpiGTw2aPKiXGqTmf4YoLek+X/KYcI+IGsidiBaaOyKu9lUYc=
X-Received: by 2002:a05:620a:111c:b0:8c7:d2b:b5ab with SMTP id af79cd13be357-8cb8ca7201cmr674983785a.37.1771840646557;
        Mon, 23 Feb 2026 01:57:26 -0800 (PST)
X-Received: by 2002:a05:620a:111c:b0:8c7:d2b:b5ab with SMTP id af79cd13be357-8cb8ca7201cmr674982885a.37.1771840646103;
        Mon, 23 Feb 2026 01:57:26 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm275752805e9.3.2026.02.23.01.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:57:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 1/1] gpio: ts4800: Remove duplicate code to handle 'ngpios' property
Date: Mon, 23 Feb 2026 10:57:13 +0100
Message-ID: <177184063429.89486.14074384001852315919.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219134647.2258593-1-andriy.shevchenko@linux.intel.com>
References: <20260219134647.2258593-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CsBb3473KVF7mBw9ffqfrEI8U6ZpURO6
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c2487 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rewbRH_RT8T0iZjiWdoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: CsBb3473KVF7mBw9ffqfrEI8U6ZpURO6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXxDQO6r1jyvQf
 96S0ONhw1gG/3XEWoUSxLwGZ1PVDkH99NX9riM1qgirzxjHT+WU6Qn26En1GIkj/ErUFxZDCSqO
 fCnVwYulJTtW8w04U4CnyO7ylSkDSzPBoDLJd/28mxawA80nPtRuqIBzZDyLo4xLme9FFCF5pDY
 mzRg105I/OkRPUm+FbdERRNReXKTltKvMCaBCday0louVIfUDCC6kz42+2gX7VNKGFjr+zSYXRU
 AkFQtY9hAw1zImJjVi6k1diKFl53AStWSitnKX1j81nhbbELXlxNA2GkeOjD2pz8O3PFs2Covoi
 1IqZeMZ8YbFyOmomfGRwy/3N1jWpX4RQ9eB2k2ppRK2GOnJED0HtSMf7WXpDdCxit1Wko9imtEv
 gmOmKN41LSL5spufUMShbeUmVdT+09JHvLnxVYwmoMT8mPf4ca2mVsBPzt4Q9lgHFQZEAZV4ZVU
 oapQWRjBWg8R8Nkek+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32022-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAE74174657
X-Rspamd-Action: no action


On Thu, 19 Feb 2026 14:46:47 +0100, Andy Shevchenko wrote:
> The gpio_generic_chip_init() handles the 'ngpios' property and
> assigns the respective field in struct gpio_chip either with
> the value of it, or, if not found, with the default based on
> the register size. There is no need to repeat this in the driver.
> 
> 

Applied, thanks!

[1/1] gpio: ts4800: Remove duplicate code to handle 'ngpios' property
      https://git.kernel.org/brgl/c/0acbe817c37344f10cb413663be494ad66bf40bc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

