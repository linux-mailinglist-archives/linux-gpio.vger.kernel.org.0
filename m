Return-Path: <linux-gpio+bounces-303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF07F25DF
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 07:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6C9AB21851
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 06:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E024E168C0;
	Tue, 21 Nov 2023 06:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mi4InY3p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469B590;
	Mon, 20 Nov 2023 22:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700548935; x=1732084935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JmpHPcDR2GOkMATNC2UbhmrpWmY/FEs9q0VQCEmc49s=;
  b=mi4InY3pJqGjm3KHJOuIk/v4DQO9jbsTy2qmtxfCzrQRdMro20j7BwaZ
   61o3H9IqAYLVwQhMiCZ/mFDeAEXhcFpPhwFR6xdz43h4M71drYM8S0IUF
   UGGz6qJbDBjHtPY77J7xO8Gv/RPWRYsz6TY59+bgVqmLicHtRnx7iuURP
   51IN66mlLZCyDR6lLFGx3ifo3R7qSO0yTNwHflUlUcfXPevzF8mQOmcyA
   ivUn7u/Sqtk17zI3NdSjz1szRjjyBiJQ4bDQqPUtDp/D7MSrBFOQ72maE
   2abp7gLixPTD6OR67E6KvIPHblPzaFxYdvYL0/UIajhQlr3J4EDSvAZIa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371948743"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371948743"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 22:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="760012743"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="760012743"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Nov 2023 22:42:04 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5KSP-0007RI-2y;
	Tue, 21 Nov 2023 06:42:01 +0000
Date: Tue, 21 Nov 2023 14:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
	s.nawrocki@samsung.com, linus.walleij@linaro.org,
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de, olof@lixom.net,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	cw00.choi@samsung.com, alim.akhtar@samsung.com
Cc: oe-kbuild-all@lists.linux.dev, peter.griffin@linaro.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	semen.protsenko@linaro.org, saravanak@google.com,
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 09/19] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
Message-ID: <202311211435.CJVOACBE-lkp@intel.com>
References: <20231120212037.911774-10-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120212037.911774-10-peter.griffin@linaro.org>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pinctrl-samsung/for-next]
[also build test WARNING on next-20231120]
[cannot apply to krzk/for-next robh/for-next linus/master v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/dt-bindings-soc-samsung-exynos-pmu-Add-gs101-compatible/20231121-052449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git for-next
patch link:    https://lore.kernel.org/r/20231120212037.911774-10-peter.griffin%40linaro.org
patch subject: [PATCH v4 09/19] dt-bindings: serial: samsung: Make samsung,uart-fifosize required property
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211435.CJVOACBE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211435.CJVOACBE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/serial/samsung_uart.yaml:141:8: [warning] wrong indentation: expected 8 but found 7 (indentation)

vim +141 Documentation/devicetree/bindings/serial/samsung_uart.yaml

     8	
     9	maintainers:
    10	  - Krzysztof Kozlowski <krzk@kernel.org>
    11	  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    12	
    13	description: |+
    14	  Each Samsung UART should have an alias correctly numbered in the "aliases"
    15	  node, according to serialN format, where N is the port number (non-negative
    16	  decimal integer) as specified by User's Manual of respective SoC.
    17	
    18	properties:
    19	  compatible:
    20	    oneOf:
    21	      - items:
    22	          - const: samsung,exynosautov9-uart
    23	          - const: samsung,exynos850-uart
    24	      - enum:
    25	          - apple,s5l-uart
    26	          - axis,artpec8-uart
    27	          - google,gs101-uart
    28	          - samsung,s3c6400-uart
    29	          - samsung,s5pv210-uart
    30	          - samsung,exynos4210-uart
    31	          - samsung,exynos5433-uart
    32	          - samsung,exynos850-uart
    33	
    34	  reg:
    35	    maxItems: 1
    36	
    37	  reg-io-width:
    38	    description: |
    39	      The size (in bytes) of the IO accesses that should be performed
    40	      on the device.
    41	    enum: [ 1, 4 ]
    42	
    43	  clocks:
    44	    minItems: 2
    45	    maxItems: 5
    46	
    47	  clock-names:
    48	    description: N = 0 is allowed for SoCs without internal baud clock mux.
    49	    minItems: 2
    50	    items:
    51	      - const: uart
    52	      - pattern: '^clk_uart_baud[0-3]$'
    53	      - pattern: '^clk_uart_baud[0-3]$'
    54	      - pattern: '^clk_uart_baud[0-3]$'
    55	      - pattern: '^clk_uart_baud[0-3]$'
    56	
    57	  dmas:
    58	    items:
    59	      - description: DMA controller phandle and request line for RX
    60	      - description: DMA controller phandle and request line for TX
    61	
    62	  dma-names:
    63	    items:
    64	      - const: rx
    65	      - const: tx
    66	
    67	  interrupts:
    68	    description: RX interrupt and optionally TX interrupt.
    69	    minItems: 1
    70	    maxItems: 2
    71	
    72	  power-domains:
    73	    maxItems: 1
    74	
    75	  samsung,uart-fifosize:
    76	    description: The fifo size supported by the UART channel.
    77	    $ref: /schemas/types.yaml#/definitions/uint32
    78	    enum: [16, 64, 256]
    79	
    80	required:
    81	  - compatible
    82	  - clocks
    83	  - clock-names
    84	  - interrupts
    85	  - reg
    86	
    87	allOf:
    88	  - $ref: serial.yaml#
    89	
    90	  - if:
    91	      properties:
    92	        compatible:
    93	          contains:
    94	            enum:
    95	              - samsung,s5pv210-uart
    96	    then:
    97	      properties:
    98	        clocks:
    99	          minItems: 2
   100	          maxItems: 3
   101	        clock-names:
   102	          minItems: 2
   103	          items:
   104	            - const: uart
   105	            - pattern: '^clk_uart_baud[0-1]$'
   106	            - pattern: '^clk_uart_baud[0-1]$'
   107	
   108	  - if:
   109	      properties:
   110	        compatible:
   111	          contains:
   112	            enum:
   113	              - apple,s5l-uart
   114	              - axis,artpec8-uart
   115	              - samsung,exynos4210-uart
   116	              - samsung,exynos5433-uart
   117	    then:
   118	      properties:
   119	        clocks:
   120	          maxItems: 2
   121	        clock-names:
   122	          items:
   123	            - const: uart
   124	            - const: clk_uart_baud0
   125	
   126	  - if:
   127	      properties:
   128	        compatible:
   129	          contains:
   130	            enum:
   131	              - google,gs101-uart
   132	              - samsung,exynosautov9-uart
   133	    then:
   134	      properties:
   135	        samsung,uart-fifosize:
   136	          description: The fifo size supported by the UART channel.
   137	          $ref: /schemas/types.yaml#/definitions/uint32
   138	          enum: [16, 64, 256]
   139	
   140	      required:
 > 141	       - samsung,uart-fifosize
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

