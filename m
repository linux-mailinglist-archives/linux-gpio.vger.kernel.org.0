Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E929B7415B0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jun 2023 17:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjF1Pwy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jun 2023 11:52:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:56324 "EHLO
        mx0a-0031df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230038AbjF1Pwx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jun 2023 11:52:53 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35SCfvsm031492;
        Wed, 28 Jun 2023 15:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=mM/crjBuJsdgjSMJGD01XqtrFQ+ghm/v2ibK3En1ebw=;
 b=CtBItgC4v3LavzcTPGecFuF9lmgrh8+n+yDxqKxNIglJczlH8g901XepekBF051nazjy
 jbYPFOP9d5OcduOXTnbbsDfJqrowueyINouj5IQ9BlqNbAteFGIzoc+nbdpESvIiSqC8
 hpozP/J3yt5GT5yN/Zv+fvKapm1JkAt3hzclz8Z6zV50VY74sjGfGSmwtKspJevE8N+R
 k8Pwt9AcEBdpJF5PoFyhlOkXUzaRFT2FG0QJQFnQygwfxmEbZcjU8GqVMcOk1p/bledK
 PN70XU5bpb+T1XnQdFbeYNIr6FSgpitm0mShQ3FkFbirrFO9sRkyc5GmBU1IomuciD2X EA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rg21taxyc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Jun 2023 15:51:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35SFptJR030238
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Jun 2023 15:51:55 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Wed, 28 Jun 2023 08:51:47 -0700
Date:   Wed, 28 Jun 2023 21:21:44 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
CC:     <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, <mathieu.poirier@linaro.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 13/21] remoterproc: qcom: refactor to leverage
 exported minidump symbol
Message-ID: <f1581356-97ba-4faa-8e1c-0d5c7ba994e3@quicinc.com>
References: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
 <1687955688-20809-14-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1687955688-20809-14-git-send-email-quic_mojha@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Pu4d_6xM3tTmi2m1FvajyDnk7XcT6zwO
X-Proofpoint-GUID: Pu4d_6xM3tTmi2m1FvajyDnk7XcT6zwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_10,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=973 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306280141
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 28, 2023 at 06:04:40PM +0530, Mukesh Ojha wrote:
> -static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsystem *subsystem,
> -			void (*rproc_dumpfn_t)(struct rproc *rproc, struct rproc_dump_segment *segment,
> -				void *dest, size_t offset, size_t size))
> +void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
> +		void (*rproc_dumpfn_t)(struct rproc *rproc,
> +		struct rproc_dump_segment *segment, void *dest, size_t offset,
> +		size_t size))
>  {
> -	struct minidump_region __iomem *ptr;
> -	struct minidump_region region;
> -	int seg_cnt, i;
>  	dma_addr_t da;
>  	size_t size;
> +	int seg_cnt;
>  	char *name;
> +	void *ptr;
> +	int ret;
> +	int i;
>  
>  	if (WARN_ON(!list_empty(&rproc->dump_segments))) {
>  		dev_err(&rproc->dev, "dump segment list already populated\n");
> -		return -EUCLEAN;
> +		return;
>  	}
>  
> -	seg_cnt = le32_to_cpu(subsystem->region_count);
> -	ptr = ioremap((unsigned long)le64_to_cpu(subsystem->regions_baseptr),
> -		      seg_cnt * sizeof(struct minidump_region));
> +	ptr = qcom_ss_md_mapped_base(minidump_id, &seg_cnt);
>  	if (!ptr)
> -		return -EFAULT;
> +		return;
>  
>  	for (i = 0; i < seg_cnt; i++) {
> -		memcpy_fromio(&region, ptr + i, sizeof(region));
> -		if (le32_to_cpu(region.valid) == MINIDUMP_REGION_VALID) {
> -			name = kstrndup(region.name, MAX_REGION_NAME_LENGTH - 1, GFP_KERNEL);
> -			if (!name) {
> -				iounmap(ptr);
> -				return -ENOMEM;
> -			}
> -			da = le64_to_cpu(region.address);
> -			size = le64_to_cpu(region.size);
> -			rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t, name);
> +		ret = qcom_ss_valid_segment_info(ptr, i, &name, &da, &size);
> +		if (ret < 0) {
> +			iounmap(ptr);
> +			dev_err(&rproc->dev,
> +				"Failed with error: %d while adding minidump entries\n",
> +				ret);
> +			goto clean_minidump;
>  		}
> -	}
> -
> -	iounmap(ptr);
> -	return 0;
> -}
> -
> -void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
> -		void (*rproc_dumpfn_t)(struct rproc *rproc,
> -		struct rproc_dump_segment *segment, void *dest, size_t offset,
> -		size_t size))
> -{
> -	int ret;
> -	struct minidump_subsystem *subsystem;
> -	struct minidump_global_toc *toc;
> -
> -	/* Get Global minidump ToC*/
> -	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
> -
> -	/* check if global table pointer exists and init is set */
> -	if (IS_ERR(toc) || !toc->status) {
> -		dev_err(&rproc->dev, "Minidump TOC not found in SMEM\n");
> -		return;
> -	}
>  
> -	/* Get subsystem table of contents using the minidump id */
> -	subsystem = &toc->subsystems[minidump_id];
> -
> -	/**
> -	 * Collect minidump if SS ToC is valid and segment table
> -	 * is initialized in memory and encryption status is set.
> -	 */
> -	if (subsystem->regions_baseptr == 0 ||
> -	    le32_to_cpu(subsystem->status) != 1 ||
> -	    le32_to_cpu(subsystem->enabled) != MINIDUMP_SS_ENABLED ||
> -	    le32_to_cpu(subsystem->encryption_status) != MINIDUMP_SS_ENCR_DONE) {
> -		dev_err(&rproc->dev, "Minidump not ready, skipping\n");
> -		return;
> +		/* if it is a valid segment */
> +		if (!ret)
> +			rproc_coredump_add_custom_segment(rproc, da, size,
> +							  rproc_dumpfn_t, name);
>  	}
>  
> -	ret = qcom_add_minidump_segments(rproc, subsystem, rproc_dumpfn_t);
> -	if (ret) {
> -		dev_err(&rproc->dev, "Failed with error: %d while adding minidump entries\n", ret);
> -		goto clean_minidump;
> -	}
> +	iounmap(ptr);
>  	rproc_coredump_using_sections(rproc);
> +
>  clean_minidump:
>  	qcom_minidump_cleanup(rproc);
>  }

I like the idea of moving minidump pieces to drivers/soc/qcom/*minidump*.

Is it possible to accept one function callback from remoteproc and do
all of this in one function exported by minidump? 

qcom_ss_valid_segment_info() seems a low level function to be exported..

Thanks,
Pavan

