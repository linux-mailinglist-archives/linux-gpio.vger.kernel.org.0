Return-Path: <linux-gpio+bounces-35394-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YARtEDXR6Wm9kgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35394-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 09:58:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7844E3E7
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 09:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBCE6302883B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 07:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8660534C121;
	Thu, 23 Apr 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrCDQDOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQEz3kXQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154CB34CFD7
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931094; cv=none; b=LBe+ZbP6WmnUTmcaDGLrsfIc/oeP1rCqVShLSdVK5+8WBxtCVTSozT171XCu5j+TbCZRHR9WCCIZditt32CuG4jlFH8bBb4a1r49a7xk9n5ZOmdB+2h1iZUR3c5Ettu38kYE1HGM+nBuj3Tgvb7DDKuIgBnP4UGzGXaIUSQk6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931094; c=relaxed/simple;
	bh=qytdyzGn+JlUXwSI45m+84Ks9ao+GUhb5DOs6caoiho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHHFD9Ag8XPU4eozySUOv6qYex3KX+6ezRCRlzIFSIdNQMhG41ozfx8hY2FQNibu4d0GfwLaXODbmiMfGDR7SNyccwD4v2f20OBeXe0mh5f3eryYKn0GjP8T3Y7nKA7S/pUFokfuQoTcR94BlKohZBInPMw3ozRLGfYlYuF+Swg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrCDQDOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQEz3kXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N2uJrD2956103
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 07:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tLtMIdnvwI34yRG6JisxagisC5laaw/phEalkWjoZnY=; b=lrCDQDOneBhwK8bQ
	kx9jR/UQBzsvXxgd8r0xbnTrccNPkVdILOhr3uH2Dd0LkoryurNcKElib+nBNcuH
	G3Os4N0yIlT52pqtdR/1JP8cjJmujO1UvkYBtVBQcWXv1SZPLE9Yd0Ghz6LUBiNm
	o42+xECvi3+Cn7qHBfK+XHxLm756gPe8VfQRUED9pvwsJRzLix1v9cO8wqdInGaY
	Qf3wtiCz3EP/SkN3zSJEHl527xwXuzwaQIw+sZtC0NquCjwKdZkbxzOKN6244/FJ
	fSwZkFMZbdasNlgYPBu4CgJPbjfkBhXyHA7V0ohNlaIxtQLxpf9iDhmLA9HAwpYK
	CprvQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q2vfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 07:58:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8ed08aa4so214431131cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 00:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776931091; x=1777535891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLtMIdnvwI34yRG6JisxagisC5laaw/phEalkWjoZnY=;
        b=AQEz3kXQWAL5dJ4x702xD2OzuHZhfCUhK+BgEU+f1wwYWyabbQHtO6ixZvLVnVP6eu
         xjZgp4Eq01VYRl0e4H1VOuXNNR1GsDg9IkY7aniE56yzAkLyRUs6p9hi+cD2F3KLIxbG
         SboqcshPXWRJGkQOPrno8VIjpSsR/I6Chp3ZpeEUKRQz/Ttml5HUBwJXGUuM+qAmnGzW
         2fGn7FmbVsXafnVVDCQWNJ6EFlEHWzMiQNxMOa0mzp9B2XSQdW+RPAnOXIDMmfA2wV06
         RAbZ0smEwl9ISqskIyLvdeJlbl2j7p8j7hpLnIcngygCzxDkCZB+BtMRchPBn0WiX3ig
         sSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776931091; x=1777535891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tLtMIdnvwI34yRG6JisxagisC5laaw/phEalkWjoZnY=;
        b=iJPrWGDDko/pVnz55qNb2EP8VmZs8PcKZrFEg9FeLcKMzvCnfVyu1g7mpRtp9alMqd
         DNldHR7Y0Q59RlAnxPOQMYe+T4AfCakmZOR5IK+NYJHkKm1BbUK0MjY2a2JYJsblBEDI
         B9eY15CP42/d/ufqcZwJdvrlPwiBRQTc0SW9zf9ZyGaM9blZSjOW8TiUlj9+tt8ZXUWg
         gPIbkDmK00FDMk68YszjxmtRrpbDB08ikcRY9L+l/zPhYTzlVUHxctEaLhu5KIdET6e4
         LOrMjvLl0t2aL2Mp0V3iFwTw/JLai2f8jqavhnmWIoApvo6+plYviyEI5SQj11SWp5R0
         aVbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9A+2e/XqFVe0Ai7WMakb8bCEI1sDxP9o4xIPcn4bEHxyUPWLUhcY+zqHJPtOdEKQyXIUJmbXM8Q2YH@vger.kernel.org
X-Gm-Message-State: AOJu0YxxyERARcC1TnFNx4UDjlOMQMn8TXcPYxK/bcQSAdRWpJm3yEBY
	Wb7IBk7KibBRIKwsFrMp5bv6wYS2l+nqR3TqcRQ3VXXyLOaXOOzY9vgJUvbMeN2doBHvFSRuTnd
	8bglFul/xlC/e5DDAkjV/yR35UgDDOSKlLvCTDZ0LJq6kKg+AF7loVdQ/ZnLNb/D0
X-Gm-Gg: AeBDiesCgGnkpDiUziAL7b9oheRa+2g29IuXzZvDaGfCp584ZsrZ7fkGe6tKkdInDsk
	mjJkQncQrDVc3kWaE+DjXEONgh25Gp2OjVkwLi0J00ze0t61Cz+aXClBnEWfIbGITXUtuavhiiQ
	TlZ+puAHDRBtJp1MYVxNIru7Yubfyd9W3XRnSYk6jbFSpuL09hTUst+2sLK1IY8+hEzpin2SGTD
	Zw39+TigyjLiBzX8/qrpyNPJUNpdmbA0k/MTYemYHeJwV51eYRkn8txYfmU7Xj6yADVS0hS0PRF
	9TbB0HF8+yMDJZR22WGfbKmGS/qGrrkn8negCzwJqEhFZ+k/Oz8rmQM53OME01bcJzuYp5viJ4y
	8Wydx+vUXk2bhBU28xvJgRmaqMCQ4hsTn/lB/zx8+r2g3kDctlee5X/fh1Cnc
X-Received: by 2002:ac8:5e4f:0:b0:50f:340f:ff2a with SMTP id d75a77b69052e-50f3410044fmr202194971cf.45.1776931091465;
        Thu, 23 Apr 2026 00:58:11 -0700 (PDT)
X-Received: by 2002:ac8:5e4f:0:b0:50f:340f:ff2a with SMTP id d75a77b69052e-50f3410044fmr202194681cf.45.1776931091109;
        Thu, 23 Apr 2026 00:58:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:68de:a8a9:cd47:7f0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm79521295e9.6.2026.04.23.00.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:58:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Yury Norov <yury.norov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Yury Norov <ynorov@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] gpio: drop bitmap_complement() where feasible
Date: Thu, 23 Apr 2026 09:58:03 +0200
Message-ID: <177693091906.5151.14291808877390373145.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260417175955.375275-1-ynorov@nvidia.com>
References: <20260417175955.375275-1-ynorov@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9d113 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Foio68cvfF0NLYD1gc0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NExORFt2H36Bz5mG-czkFYXju8Zgae3g
X-Proofpoint-ORIG-GUID: NExORFt2H36Bz5mG-czkFYXju8Zgae3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA3NiBTYWx0ZWRfXyXgkm6L5AhNA
 PDidv3S49npAsHedBpal3IO3S8CQPA+RvnOkD6RkmnjelNgvh1vJ338uIYZSeHyciDocIBPJZBT
 +cBeO7TT5c36iGZZs3NDR/+rnfY36Cj1+XyB1iH2/LtJ3TPlN0+zirODOzy45G41/bGLZie96aR
 vqmPdVipZriwPsAjoPEiEXQwyVobe1vZsEc8ZViyo+LvdyTlr28D/H/hJ8JhoB0XzJjTAq3+k+X
 S92XO9cmj/D1T/K5SFfzcxt1Alo8jbjzByQbFWLG2vO5tYLkt/gMwZPsvM+8aYyggLX0QSN/064
 EIUXlQU3q+a1dNwdVd8uKAxccu80RnZ/zKNX7FUMEpgBSHiPHTHlthHzU3/17mQM2uwKvGvyN72
 DF8t3+LSkzoDp3DE3/rv1LCXL4GSYsSvNhu1I57iCEFP+2TmcUWoVpsP+EBvEL2ALDvjItEJjk1
 UC026TBd7mE92tsnsXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35394-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,amd.com,gmail.com,vger.kernel.org,lists.infradead.org,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97F7844E3E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 17 Apr 2026 13:59:52 -0400, Yury Norov wrote:
> The gpio drivers reproduce the following pattern:
> 
> 	bitmap_complement(tmp, data1, nbits);
> 	bitmap_and(dst, data2, tmp, nbits);
> 
> This can be done in a single pass:
> 
> [...]

Tweaked the grammar in commit messages and applied, thanks!

[1/2] gpio: pca953x: drop bitmap_complement() where feasible
      https://git.kernel.org/brgl/c/a56604e397575647bfc425a8df176948577a364e
[2/2] gpio: xilinx: drop bitmap_complement() where feasible
      https://git.kernel.org/brgl/c/2757a5b1bca76a1b6378496b669a2baf1faddec5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

