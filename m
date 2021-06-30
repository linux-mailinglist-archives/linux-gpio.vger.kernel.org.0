Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7103B87F2
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 19:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbhF3Rt7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 13:49:59 -0400
Received: from mail-sn1anam02on2066.outbound.protection.outlook.com ([40.107.96.66]:5682
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232585AbhF3Rt6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Jun 2021 13:49:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9w5nyshtqZkdrAuM4G/AJ1tu/1yKl6p0dmjKKb822cLTaiLPZ272fe0Mlq2u4qpF01pA1j6q3rO211hh+mfJxJIp1FTMtuBWdA8P8VLlz7BYTL13OeqpNEZRYLPu4/POt2faE+tmM0YsjzkBLWI4t5cjsxPlzsRqJ5BOjblP7GjtBLors8f2Kwken64dye27tpgAbAabeQC1it0MxVLMYy13dH1iovFcSdbvEASRri+vyxq+1zsMmg64XpTcVMuNeSZnEIvKbQFrvLXlsYe+nFtixHESEAkcoChIA7JF1MpaHVWT55uof1rNToiH4QkYHTC8yEYbv10et3+guouzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzct2mlhLfIzHMmwPNQD1n9lmX+jZkKe6f0cq0ViKeA=;
 b=Y5kllxYcZbZBgelMIiFIfOYl87LFRyBNd+BHR5jTMJ6LaMZbB4+8mwm/XJ8Ro7Unzx1JznLT6NQDaHK2haiuSkmp6oeU5YJBAJutEr+5zWxIPCrxD82Q3YjnTC5S7n8co4EhgTKlX8K8Y5FrzPzgl+++tdfjzJ6G3PP7Ykop3jRM2ZohXUpqSrB992606569fsE+pBN9qrtvEfDj/wBDKuSRaehME9D8k1R6CrvLVZ4hyL3ohL5xAwZYOVk5WWRCvL4xG22s3QXZodT7XXA1ItmcJJv216JFJInX+58dapbG6VMw/wqujYW1/3cvOlSV9b6bd0u4kuPVyg6+dnG+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzct2mlhLfIzHMmwPNQD1n9lmX+jZkKe6f0cq0ViKeA=;
 b=rQq3yqMDP+OemhUwZPfzoeyV16USiwofFCUP3WFYMMMjsfJ3vseXq4T/+7uDQPEfgVJxy/iexZaq700FxuGn1XwxdkR8dV93Fy3lyR3/0TNP7StTFw6o1nUSHkd0s0wk5f1J2tNKYAOOd44Msg74ab2UL4HtKLX63J6j/ynFN90mYXeaKJ6X3PX1wvMKXUeXDN+yK0jrcd5K8rrs0a55n0RBsnWUGRpPmKed6Pji//RhuUXIklnNW2ze0xg4TB2VSgxKZfivcua2Rj3kKnsWb+FLtm2ggV1FcekxtqHCelXtocjsH5pZRZRCXWJGr/eJ80B3mL3TYHtmoHXOuxxWFA==
Received: from DM3PR12CA0100.namprd12.prod.outlook.com (2603:10b6:0:55::20) by
 BN6PR1201MB0260.namprd12.prod.outlook.com (2603:10b6:405:50::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Wed, 30 Jun
 2021 17:47:27 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::5a) by DM3PR12CA0100.outlook.office365.com
 (2603:10b6:0:55::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Wed, 30 Jun 2021 17:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 17:47:26 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun
 2021 10:47:25 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun
 2021 17:47:25 +0000
Received: from kyarlagadda-linux.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 17:47:21 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     <andy.shevchenko@gmail.com>
CC:     <akhilrajeev@nvidia.com>, <bgolaszewski@baylibre.com>,
        <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>,
        <ldewangan@nvidia.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <mperttunen@nvidia.com>,
        <smangipudi@nvidia.com>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: Add ACPI support
Date:   Wed, 30 Jun 2021 23:17:19 +0530
Message-ID: <1625075239-19120-1-git-send-email-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAHp75VdkC4vcOnC37D4iDZs3g=2K=+iTsXZX=20CK2Og6WtgPA@mail.gmail.com>
References: <CAHp75VdkC4vcOnC37D4iDZs3g=2K=+iTsXZX=20CK2Og6WtgPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63b02bca-6776-45a6-5f73-08d93bef1fec
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0260:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB026078D38291857BEC23491EC0019@BN6PR1201MB0260.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uObmLxZgrVn4P7V3o+gRu9ixVFqx/vge5cyrD/5M11Y1lst38o3NBdqridHk2FcVoXZdaqhQ3ljxdSHYHZLXmzHGPqEVWtLu8nqfmwmAeDhDu+59tKA/nIHdrv5golKOd9Ngk0vAOAzA8r2TzNcZJ0ztFO0M0o34vAD07OIr/ztdOR6AxrGiqk5IyGSqmXx8u1T4IyI9LQbFZG5IE28bwqnu/LsMSVeryiLGpooQBhEHphcxJuTB8YJnTzdOCj3Wds9vyFuasPI4UyUDWMb5j/AErG3bul/gg5eIwViYCtqkc48oH6zNeaN81n2b0G/tFz3Ak7JrwF9jGrXMrkiNSjoS1Bk/X2to5NEQ+ZjtdUowrgjbwYULvnE2oRzaKMS5aIDGqSl2dblrKyO1MD1LL4JhDRIMOUhvJqi51uF6b+txY1o8s/UMO9GXf65UtSdIgQvple2YsZzCpXmEpmOmGB3TBHARsX/E4gFgalocxokAjsNmjxKr0T+D2vS8PiUkg2YcJL9cXOlnZn4t2hhAJmDBFqaF2ljuxZBEHcGiTPgp3Ui9piKOUkkOcFFKJWSKbRZ70W1dm07miGagQiqZNO9DgXqzkn6kvbKI3sxj9o4kreNdltrR/GAolvDepao/Gokp3N7XmMym8B+IHno8A8lqpV8Tf0Dur2NX8VINcFnwjzYAz6f7EM7s0wpGrxmabI73yp8Zopt7Dyrdt7uWyw==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(46966006)(47076005)(54906003)(82310400003)(316002)(83380400001)(82740400003)(7696005)(336012)(6916009)(5660300002)(86362001)(7636003)(356005)(70586007)(478600001)(2616005)(36860700001)(2906002)(426003)(36756003)(26005)(8936002)(70206006)(4326008)(8676002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 17:47:26.7463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b02bca-6776-45a6-5f73-08d93bef1fec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0260
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> > >What about doing like
> >
> >      gpio->secure = devm_platform_ioremap_resource_byname(pdev, "security");
> > >      if (IS_ERR(gpio->secure))
> > >              gpio->secure = devm_platform_ioremap_resource(pdev, 0);
> > >      if (IS_ERR(gpio->secure))
> > >              return PTR_ERR(gpio->secure);
> > >
> > >and similar for gpio->base?
> >
> > Wouldn't this cause a redundant check if it had already succeeded in getting
> > the resource by name? Also, could it happen that if the device tree is
> > incorrect, then one of the resource is fetched by name and other by the index,
> > which I guess, would mess things up. Just my random thoughts, not sure if it
> > is valid enough.
> >
> > >Wouldn't the following be enough?
> > >
> > >-       gpio->intc.name = pdev->dev.of_node->name;
> > >+       gpio->intc.name = devm_kasprintf(&pdev->dev, "%pfw",
> > >dev_fwnode(&pdev->dev));
> > >+       if (!gpio->intc.name)
> > >+
> >
> > How about this way? I feel it would be right to add the OF functions conditionally.
> 
> Looks okay, although I have a question here.
> 
> +   if (pdev->dev.of_node) {
> 
> Do we really need this check at all? If the OF-node is NULL then it
> doesn't matter if other fields are filled or not, correct?
> 
> What you need is #ifdef CONFIG_OF_GPIO (IIRC the name correctly).
> 
> > +       gpio->gpio.of_node = pdev->dev.of_node;
> > +       gpio->gpio.of_gpio_n_cells = 2;
> > +       gpio->gpio.of_xlate = tegra186_gpio_of_xlate;
> > +   }
> >
> > +   gpio->intc.name = gpio->soc->name;

Okay. It makes sense. Thanks Andy. I would make the changes and send out an updated patch.

--
Best Regards,
Akhil
