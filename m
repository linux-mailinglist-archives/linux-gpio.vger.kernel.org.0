Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747033DB0C5
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 03:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235581AbhG3Brl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 21:47:41 -0400
Received: from mail-bn8nam12on2052.outbound.protection.outlook.com ([40.107.237.52]:22497
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234986AbhG3Brk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jul 2021 21:47:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f65fEeaJCaxWKrXTgMfGL+piXCQn7ibaw5FpI+cslRISzX6eR7E8Rp/hjsEybU16M76Icy5L461ep7/PeSc949Cie2igTlNsTS6rgtLUL+uYM3jwaVA3mBijtR734/M29AYt45iPHWlrTMwwz8AfgGPkSk6ixHTWVZG0/yw1xCfuorsdqDKZD09nEreLO0BG51nDJRP6xqRq2Oc5VwnIZzytoi2AaVfND30r1W+UHE46hMN/5LnVl34Z1NN6m8sYygBXXrrwA8qgYIQHpPFWWfavebyfAiKmbG5WwY4jHLuCAa4CtQwZM5nAW+N/Uy/BFiM/zZU4t9u5pOZlWJH67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxTYYMUGlesP/XTUESwMCIBJ8QTzbvFcOlOzHl6t7QU=;
 b=OkdAvB/1MDNPCcWyG/6Dc3i2FG734dLOhbHleBi/VRQMv7BPSr02TlavNdxK+yOU4axmoz69PqYt7V3DjD51ohmksFChKqcVpqpTljSMJBd0deu8cf8BM+4MhdAY6u7xFytAwkMc7JDBREOeaJwmhyFQWzvkhx5XUefGShqd85axMB9qBmcdf6kstZLbX4YHaoDkxNrXWUf2/f57KuJ2eEXO0pM1NIFoeAtkV+cIOwrpduAKF0iQJwc0Gy7IvzHX6BQulx4wfNYyUCbKq51ggRmllXRsyP1UpY/r00wxnBsDwd49LvTCM/nDGXV9KkhLB41DSRYxnbxziDcgoNePTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxTYYMUGlesP/XTUESwMCIBJ8QTzbvFcOlOzHl6t7QU=;
 b=BDblxv5RjHixMlXU0o/rQiapLaDHeWWfXC9d9cOWgChYAXRovfWPoXturuivMDTw/FbTb9WoHVcZ1tdjFNWKMaHPsnF1vW+4he8/RxQRRDdUMItsQrC+/tCIZsvdr2uk3qfUKCi/LQaE1I+4TLkOnX8hF7cXme9Vkbq1DUoxnLuRykPDRluOI9Llgl3/zQAaZNVEhyJWf0TQ8uSkkKnm/TT/HWwJSkfHL8FpAhfojvK53uL1mHD/qqYs854L+8deLOxHqMsZt46kf9fRTnGTCd2XX8gHTKLXVS3YXDmtFdxHR7u5lU7XcUkjpcH8ci7RT6czTy3E9zB8gf0GDTxzbw==
Received: from CO2PR04CA0172.namprd04.prod.outlook.com (2603:10b6:104:4::26)
 by CY4PR1201MB0086.namprd12.prod.outlook.com (2603:10b6:910:17::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Fri, 30 Jul
 2021 01:47:33 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:4:cafe::b6) by CO2PR04CA0172.outlook.office365.com
 (2603:10b6:104:4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 01:47:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 01:47:32 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 01:47:32 +0000
Subject: Re: [RFC 04/11] dt-bindings: Add HTE bindings
To:     Rob Herring <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <robh+dt@kernel.org>, <linus.walleij@linaro.org>,
        <thierry.reding@gmail.com>, <bgolaszewski@baylibre.com>,
        <linux-doc@vger.kernel.org>, <warthog618@gmail.com>,
        <jonathanh@nvidia.com>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-5-dipenp@nvidia.com>
 <1625148163.519744.2278695.nullmailer@robh.at.kernel.org>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <880c0d4e-bf7c-feea-c66a-512c124a3669@nvidia.com>
Date:   Thu, 29 Jul 2021 18:56:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625148163.519744.2278695.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57497c2d-7cfb-42fe-58ce-08d952fbff7e
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0086:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00865EE299F543154F7BC4F3AEEC9@CY4PR1201MB0086.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5vsIQQO0ymCjaJ7xz+62ftKxxJUYTQrBOTzV0ne1K27jLkw5ktfmF5tzO3CYJw0LJYRm8YVPo0HU/Re/iasULKaBVZ2Y8L5J5frvNpRF/m/1i4SffckZyTHLedqXKGmv0ynDh1LnaGXJFpFe+8ctMo+XjLnHnvg7OQ3edkg3s7r4CtkLOynnU3LUiXGsQanp9xya1JiBqrs7kXKfkRhfuv6EugeaPMTZgZlxS4D8DaoSzv/TeevxwTCfrpvukMDG9rbY5qFURt2angmyePRbqG4mHts+IvJe84b557hWPZse6p1Jm1FqurgtP/ZIuyaHTd9SgM7xy77jH2GKS5uHuxlfkZoHLQ/N898nO2jjfxyF2BtB14k2u+WgdByw+rsdos/CQFE9Rq0gbxCn/invwoXHtJTHUN/tMgxstR3dhARmGgcDlVF3wLs+jamEirbC/V3+If1MypwZ4FwpxLkKTlvG+Pl0Pk2v2ecxrlKvs7nHNoABQYdqBMgHFGInbSQIEsf2rirfg4GgAotHVgRmGuZ1n3UhxgcOC+OMogZZ5WiDQr/5UVq5Hq6FwYhdJAxg8YAMh4u9XvLpGkT4iDQYh59cym+QJmlB7oCmiQdi+qxSEyeVilCqLXJlwI7rokh0D3DVAfoDaG3+AcmvuyPkteDMzJi1dpHw98YOZrfbntosxOOiGI7TZ0UfdNA4GuUk4JNfLEDpujpU9QTul2xAUeBCc8KUYXYcFtFSeuySkIy+ILPqW7aM1We8Y+f7SK97Yi57ei72mraiPZ8l4LCo+KN9RW9ZkwW47B3ihOmTOjfpPYOxf70dqGPZI3JEpj7
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(16526019)(2906002)(8936002)(186003)(31686004)(47076005)(36756003)(8676002)(966005)(54906003)(426003)(6916009)(53546011)(82310400003)(4326008)(83380400001)(31696002)(86362001)(5660300002)(36860700001)(7636003)(26005)(498600001)(70586007)(356005)(36906005)(16576012)(336012)(107886003)(70206006)(2616005)(7416002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 01:47:32.5235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57497c2d-7cfb-42fe-58ce-08d952fbff7e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0086
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Rob, I will correct those warning.

On 7/1/21 7:02 AM, Rob Herring wrote:
> On Fri, 25 Jun 2021 16:55:25 -0700, Dipen Patel wrote:
>> Introduces HTE devicetree binding details for the HTE subsystem. It
>> includes examples for the consumers, binding details for the providers
>> and specific binding details for the Tegra194 based HTE providers.
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
>> ---
>>  .../devicetree/bindings/hte/hte-consumer.yaml | 47 +++++++++++
>>  .../devicetree/bindings/hte/hte.yaml          | 34 ++++++++
>>  .../bindings/hte/nvidia,tegra194-hte.yaml     | 83 +++++++++++++++++++
>>  3 files changed, 164 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hte/hte-consumer.yaml
>>  create mode 100644 Documentation/devicetree/bindings/hte/hte.yaml
>>  create mode 100644 Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml
>>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml:40:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
> ./Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml:41:5: [warning] wrong indentation: expected 5 but found 4 (indentation)
> ./Documentation/devicetree/bindings/hte/nvidia,tegra194-hte.yaml:45:5: [warning] wrong indentation: expected 5 but found 4 (indentation)
> ./Documentation/devicetree/bindings/hte/hte.yaml:34:7: [error] no new line character at the end of file (new-line-at-end-of-file)
>
> dtschema/dtc warnings/errors:
> \ndoc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1497480
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>
